import sys
import json

def mock_process_user_data(data):
    return 42  

if __name__ == "__main__":
    input_json = sys.argv[1]
    user_data = json.loads(input_json)

    group_number = mock_process_user_data(user_data)
    print(group_number)