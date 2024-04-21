import sys
import json
import pandas as pd
from kerykeion import Report, AstrologicalSubject
from sklearn.preprocessing import OneHotEncoder
import numpy as np
from datetime import date
from sklearn.neighbors import KNeighborsClassifier
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score
from sklearn.cluster import KMeans

def dict_to_feature_vector(data_dict):
    feature_vector = []
    for key, value in data_dict.items():
        if isinstance(value, dict):
            for sub_key, sub_value in value.items():
                feature_vector.append(sub_value)
        else:
            feature_vector.append(value)
    return feature_vector


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


# file_path = 'touch_grass3.csv'
# df = pd.read_csv(file_path)
# df

def train_model(data):
    df = pd.json_normalize(data)

    todays_date = date.today()
    new_features = None
    # new_features = np.empty((df.shape[0], 26))
    # print(new_features)
    for index, row in df.iterrows():
        # Args: Name, year, month, day, hour, minuts, city, nation(optional)
        person = AstrologicalSubject(row['Name'], row['Year'], 6, row['Day'], row['Hour'], row['Minuts'],
                                     "Philadelphia")
        report = Report(person)
        planet_table = report.planets_table
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
    data['Personality Type'] = data['Personality Type'].map(personality_myers)
    data['Introvert_Extrovert'] = data['Introvert_Extrovert'].map(personality_intro_extro)
    data['Astrology Sign'] = data['Astrology Sign'].map(astro_num)

    y = data['Personality Type']
    X = data.drop(['Name', 'Month', 'Day', 'Hour', 'Minuts'], axis=1)
    X.columns = X.columns.astype(str)

    # Number of clusters
    k = 7

    # Initialize KMeans model
    kmeans = KMeans(n_clusters=k)

    # Fit the model to the data and predict cluster labels
    X['Cluster'] = kmeans.fit_predict(X)


def model(data):
    df = pd.json_normalize(data)

    todays_date = date.today()
    new_features = None
    # new_features = np.empty((df.shape[0], 26))
    # print(new_features)
    for index, row in df.iterrows():
        # Args: Name, year, month, day, hour, minuts, city, nation(optional)
        person = AstrologicalSubject(row['Name'], row['Year'], 6, row['Day'], row['Hour'], row['Minuts'],
                                     "Philadelphia")
        report = Report(person)
        planet_table = report.planets_table
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
    data['Personality Type'] = data['Personality Type'].map(personality_myers)
    data['Introvert_Extrovert'] = data['Introvert_Extrovert'].map(personality_intro_extro)
    data['Astrology Sign'] = data['Astrology Sign'].map(astro_num)

    y = data['Personality Type']
    X = data.drop(['Name', 'Month', 'Day', 'Hour', 'Minuts'], axis=1)
    X.columns = X.columns.astype(str)
    k = 6
    knn = KNeighborsClassifier(n_neighbors=k)
    knn.fit(X, y)
    dump(knn, 'model_filename.joblib')


def mock_process_user_data(data):
    loaded_model = load('knn_model.joblib')
    prediction = loaded_model.predict(data)
    return prediction

if __name__ == "__main__":
    input_json = sys.argv[1]
    user_data = json.loads(input_json)

    group_number = mock_process_user_data(user_data)
    print(group_number)