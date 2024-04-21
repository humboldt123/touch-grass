import pandas as pd
from kerykeion import Report, AstrologicalSubject
import numpy as np
from sklearn.neighbors import KNeighborsClassifier
from sklearn.cluster import KMeans
from joblib import dump
from supabase import create_client, Client

url: str = 'https://qcmfqvuxuwebxbrbogje.supabase.co'
key: str =  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFjbWZxdnV4dXdlYnhicmJvZ2plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM2Mjg3NzcsImV4cCI6MjAyOTIwNDc3N30.6guLDAwayVf2rL2LYgIFABXq4z1x5mWqbeEoSJJUnAo"
supabase: Client = create_client(url, key)

def horoscope_to_feature_vector(horoscope_data):
    positions = []
    rets = []

    for planet, data in horoscope_data.items():
        positions.append(data['Position'])

        # Encode Ret values as binary (0 for '-', 1 for 'R')
        ret_binary = 1 if data['Ret'] == 'R' else 0
        rets.append(ret_binary)

    # Convert positions and rets to 1D numpy arrays
    positions = np.array(positions)
    rets = np.array(rets)
    # print(positions)
    # print(rets)

    # Concatenate position values, ret values, and houses_encoded
    feature_vector = np.hstack((positions.reshape(-1, 1), rets.reshape(-1, 1)))

    return feature_vector

def model(data):
    df = pd.DataFrame(response.data)
    df = df.drop(['id', 'created_at', 'dob', 'mbti', 'tarot', 'lat', 'lng', 'groupNum'], axis = 1)
    df = df.iloc[2:]
    df = df.reset_index(drop=True)
    new_features = None
    # new_features = np.empty((df.shape[0], 26))
    # print(new_features)
    for index, row in df.iterrows():
        # Args: Name, year, month, day, hour, minuts, city, nation(optional)
        person = AstrologicalSubject(row['name'], int(row['Year']), int(row['Month']), int(row['Day']), int(row['Hour']), int(row['Minutes']),
                                     "Philadelphia")
        report = Report(person)
        lines = report.planets_table.split('\n')

        data = {}
        count = 0
        for line in lines:
            if line.strip().startswith('|'):
                count += 1
                if count > 1:
                    line_data = line.strip().split('|')
                    line_data = line_data[1:]
                    line_data.pop(1)
                    line_data = line_data[:-2]
                    # print(line_data)
                    if len(line_data) == 3:
                        planet = line_data[0].strip()
                        pos = float(line_data[1].strip())
                        ret = line_data[2].strip()
                        data[planet] = {'Position': pos, 'Ret': ret}

        feature_vector = horoscope_to_feature_vector(data)
        feature_vector = feature_vector.flatten()
        #     print(feature_vector)
        if new_features is None:
            new_features = feature_vector
        else:
            new_features = np.vstack((new_features, feature_vector))

    df1 = pd.DataFrame.from_records(new_features)
    frames = [df, df1]
    data = pd.concat(frames, axis=1)

    personality_myers = {'ISTJ': 1, 'ISTP': 2, 'ISFJ': 3, 'ISFP': 4, 'INFJ': 5, 'INFP': 6, 'INTJ': 7, 'INTP': 8,
                         'ESTP': 9, 'ESTJ': 10, 'ESFP': 11, 'ESFJ': 12, 'ENFP': 13, 'ENFJ': 14, 'ENTP': 15, 'ENTJ': 16}
    personality_intro_extro = {'I': 0, 'E': 1}
    astro_num = {'Aries': 1, 'Taurus': 2, 'Gemini': 3, 'Cancer': 4, 'Leo': 5, 'Virgo': 6, 'Scorpio': 7,
                 'Sagittarius': 8, 'Capricorn': 9, 'Aquarius': 10, 'Pisces': 11}
    data['Personality_Type'] = data['Personality_Type'].map(personality_myers)
    data['Introvert_Extrovert'] = data['Introvert_Extrovert'].map(personality_intro_extro)
    data['Astrology_Sign'] = data['Astrology_Sign'].map(astro_num)

    X = data.drop(['name', 'Month', 'Day', 'Hour', 'Minutes'], axis=1)
    # print(X.columns)
    X.columns = X.columns.astype(str)
    k = 7
    kmeans = KMeans(n_clusters=k)
    # Fit the model to the data and predict cluster labels
    X['groupNum'] = kmeans.fit_predict(X)
    # print(kmeans.fit_predict(X))
    y = X['groupNum']
    knn = KNeighborsClassifier(n_neighbors=k)
    knn.fit(X, y)
    dump(knn, 'trained_model.joblib')

    return X['groupNum']

response = supabase.table('person').select("*").execute()
# print(response.data)
# df = pd.DataFrame(response.data)
# df = df.drop(['id', 'created_at', 'name', 'dob', 'mbti', 'tarot', 'lat', 'lng', 'groupNum'], axis = 1)
# df = df.iloc[2:]
# df = df.reset_index(drop=True)
groupNum = model(response)
update_response = supabase.table('person').update({'groupNum': groupNum})