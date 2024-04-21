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
from joblib import dump, load


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


def mock_process_user_data(data):
    person = AstrologicalSubject(data['name'], data['Year'], data["Month"], data['Day'], data['Hour'], data['Minutes'], "Philadelphia")
    report = Report(person)
    lines = report.planets_table.split('\n')
    horoscope = {}
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
                    horoscope[planet] = {'Position': pos, 'Ret': ret}

    feature_vector1 = horoscope_to_feature_vector(horoscope)
    feature_vector1 = feature_vector1.flatten()
    print(len(feature_vector1))

    personality_myers = {'ISTJ': 1, 'ISTP': 2, 'ISFJ': 3, 'ISFP': 4, 'INFJ': 5, 'INFP': 6, 'INTJ': 7, 'INTP': 8,
                         'ESTP': 9, 'ESTJ': 10, 'ESFP': 11, 'ESFJ': 12, 'ENFP': 13, 'ENFJ': 14, 'ENTP': 15, 'ENTJ': 16}
    personality_intro_extro = {'I': 0, 'E': 1}
    astro_num = {'Aries': 1, 'Taurus': 2, 'Gemini': 3, 'Cancer': 4, 'Leo': 5, 'Virgo': 6, 'Scorpio': 7,
                 'Sagittarius': 8, 'Capricorn': 9, 'Aquarius': 10, 'Pisces': 11}
    data['Personality_Type'] = personality_myers.get(data["Personality_Type"], data["Personality_Type"])
    data['Introvert_Extrovert'] = personality_intro_extro.get(data['Introvert_Extrovert'], data['Introvert_Extrovert'])
    data['Astrology_Sign'] = astro_num.get(data['Astrology_Sign'], data['Astrology_Sign'])
    keys = ['Year', 'Personality_Type', 'Introvert_Extrovert', 'Minority', 'Educational_Disability', 'Physical_Disability', 'Degree_Acquired', 'Astrology_Sign']
    feature_vector2 = np.array([data[key] for key in keys])
    print(len(feature_vector2))
    feature_vector = np.concatenate((feature_vector2, feature_vector1), axis=None)
    extra_feature = np.array([0])
    feature_vector = np.concatenate((feature_vector, extra_feature), axis=None)
    feature_vector = np.reshape(feature_vector, (1, len(feature_vector)))
    print(len(feature_vector[0]))

    loaded_model = load('trained_model.joblib')
    prediction = loaded_model.predict(feature_vector)
    return prediction[0]

if __name__ == "__main__":
    input_json = sys.argv[1]
    user_data = json.loads(input_json)
    group_number = mock_process_user_data(input_json)
    print(group_number)