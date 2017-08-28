import mysql.connector

class Database:
    def __init__(self, host, port, user, password, database):
        self.connector = mysql.connector.connect(host=host, port=port, user=user, password=password, database=database)

    def add_user(self, name):
        self.__execute__('insert into user(name) values(%s)', [name])

    def add_pet(self, user_id, device, nickname, breed, age, raise_time):
        self.__execute__('insert into pet(device, nickname, breed, age, raise_time) values(%s, %s, %s, %s, %s)',
                [device, nickname, breed, age, raise_time])
        relation = self.select_relation_by_user_id(user_id)
        if relation:
            self.__execute__('update relation set device=%s where user_id=%s', [device, user_id])
        else:
            self.__execute__('insert into relation(user_id, device) values(%s, %s)', [user_id, device])
        self.add_latest(user_id, device)

    def select_relation_by_user_id(self, user_id):
        return self.__execute_query__('select * from relation where user_id=%s', [user_id])

    def select_pets_by_user_id(self, user_id):
        return self.__execute_query__('select * from pet where device in (' 
                                      'select device from relation where user_id in %s)',
                                      [user_id])

    def add_environment(self, device, time, temperature, humidity, smoke):
        self.__execute__('insert into environment(device, time, temperature, humidity, smoke) values(%s, %s, %s, %s, %s)',
            [device, time, temperature, humidity, smoke])

    def add_accompany(self, user_id, device, period, end_time):
        self.__execute__('insert into accompany(user_id, device, period, end_time) values(%s, %s, %s, %s)',
            [user_id, device, period, end_time])

    def add_distance(self, user_id, device, distance, end_time):
        self.__execute__('insert into distance(user_id, device, distance, end_time) values(%s, %s, %s, %s)',
                         [user_id, device, distance, end_time])

    def select_latest_period(self, user_id, device):
        return self.__execute_query__('select period from latest where user_id=%s and device=%s',
                         [user_id, device])
    def select_latest_distance(self, user_id, device):
        return self.__execute_query__('select distance from latest where user_id=%s and device=%s',
                                      [user_id, device])

    def update_latest_period(self, user_id, device, period):
        self.__execute__('update latest set period=%s where user_id=%s and device=%s',
                         [period, user_id, device])

    def update_latest_distance(self, user_id, device, distance):
        self.__execute__('update latest set distance=%s where user_id=%s and device=%s',
                         [distance, user_id, device])

    def add_latest(self, user_id, device):
        self.__execute__('insert into latest(user_id, device, period, distance) values(%s, %s, %s, %s)',
                         [user_id, device, 0, 0])

    def select_latest(self, user_id, device):
        return self.__execute_query__('select distance, period from latest where user_id=%s and device=%s',
                               [user_id, device])

    def __execute__(self, sql, values):
        cursor = self.connector.cursor()
        cursor.execute(sql, values)
        self.connector.commit()
        cursor.close()

    def __execute_query__(self, sql, values):
        cursor = self.connector.cursor()
        cursor.execute(sql, values)
        result = cursor.fetchall()
        cursor.close()
        return result
