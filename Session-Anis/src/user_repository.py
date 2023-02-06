import sqlite3

class UserRepository:

    def __init__(self) -> None:
        self.db_path = './todo.db'
        self.connection = None
        self.NOT_STARTED = "Not Started"

    def connect_db(self):
        if self.connection is None:
            self.connection =  sqlite3.connect(self.db_path, check_same_thread=False)

    def add_user(self, name, address, mob):
        try:
            self.connect_db()
            cursor = self.connection.cursor()
            insert_cursor = cursor.execute('insert into Users (name, address, mobile) VALUES (?,?,?)',
            (name, address, mob))
            self.connection.commit()
            return{
                'id': insert_cursor.lastrowid,
                'name': name,
                'address': address,
                'mobile': mob
            }
        except Exception as e:
            raise Exception('Error: ', e)




