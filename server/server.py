from flask import Flask, request
from database import Database

import ConfigParser
import json

pet_columns = ['id', 'device', 'breed', 'age', 'raise_time']

def init():
    host, port, user, password, database = load_database_config()
    database = Database(host, port, user, password, database)
    app = Flask(__name__)
    return database, app

def load_database_config():
    config_parser = ConfigParser.ConfigParser()
    config_parser.read('../config/database.conf')
    host = config_parser.get('database', 'host')
    port = config_parser.get('database', 'port')
    user = config_parser.get('database', 'user')
    password = config_parser.get('database', 'password')
    database = config_parser.get('database', 'database')
    return host, port, user, password, database

def json2str(columns, data):
    l = []
    for item in data:
        d = {}
        for i, column in enumerate(columns):
            d[column] = item[i]
        l.append(d)
    return json.dumps(l)

database, app = init()

@app.route('/')
def hello():
    return 'Hello World!'

@app.route('/add_user', methods=['POST'])
def add_user():
    json_data = json.loads(request.data)
    database.add_user(json_data['name'])
    return '{\'status\':\'ok\'}'

@app.route('/add_pet', methods=['POST'])
def add_pet():
    json_data = json.loads(request.data)
    database.add_pet(json_data['user_id'], json_data['device'], json_data['nickname'], json_data['breed'], int(json_data['age']), json_data['raise_time'])
    return '{\'status\':\'ok\'}'

@app.route('/query_pets', methods=['POST'])
def query_pets():
    json_data = json.loads(request.data)
    pets = database.select_pets_by_user_id(json_data['user_id'])
    json_string = json2str(pet_columns, pets)
    response = {'status': 'ok',
                'data': json_string}
    return json.dumps(response)

@app.route('/add_environment', methods=['POST'])
def add_environment():
    json_data = json.loads(request.data)
    database.add_environment(json_data['device'], json_data['time'], json_data['temperature'], json_data['humidity'], json_data['smoke'])
    return '{\'status\':\'ok\'}'

@app.route('/add_period_distance', methods=['POST'])
def add_period_distance():
    json_data = json.loads(request.data)
    flag = json_data['flag']
    if int(flag) == 0:
        database.add_distance(json_data['user_id'], json_data['device'], json_data['distance'], json_data['end_time'])
        latest_distance = database.select_latest_distance(json_data['user_id'], json_data['device'])[0][0] + int(json_data['distance'])
        database.update_latest_distance(json_data['user_id'], json_data['device'], latest_distance)
    elif int(flag) == 1:
        database.add_accompany(json_data['user_id'], json_data['device'], json_data['period'], json_data['end_time'])
        latest_period = database.select_latest_period(json_data['user_id'], json_data['device'])[0][0] + int(json_data['period'])
        database.update_latest_period(json_data['user_id'], json_data['device'], latest_period)
    return '{\'status\':\'ok\'}'

@app.route('/query_period_distance', methods=['POST'])
def query_period_distance():
    json_data = json.loads(request.data)
    json_string = database.select_latest(json_data['user_id'],json_data['device'])
    response = {'status':'ok',
                'data':json_string}
    return json.dumps(response)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8888)