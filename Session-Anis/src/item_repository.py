import sqlite3

class ItemRepository:
    def __init__(self) -> None:
        self.db_path = './todo.db'
        self.connection = None
        self.NOT_STARTED = "Not Started"

    def connect_db(self):
        if self.connection is None:
            self.connection =  sqlite3.connect(self.db_path, check_same_thread=False)

    def get_all_items(self):
        try:
            self.connect_db()
            cursor = self.connection.cursor()
            rows = cursor.execute('select * from items')
            return rows
        except Exception as e:
            raise Exception('Error: ',e)

    def get_item(self, id):
        try:
            self.connect_db()
            cursor = self.connection.cursor()
            rows = cursor.execute('select * from items where id=?',(id,))
            return rows
        except Exception as e:
            raise Exception('Error: ',e)

    def add_item(self, item, reminder):
        try:
            self.connect_db()
            cursor = self.connection.cursor()
            insert_cursor = cursor.execute('insert into items (item, status,reminder) VALUES (?,?,?)',
            (item, self.NOT_STARTED, reminder))
            self.connection.commit()
            return{
                'id': insert_cursor.lastrowid,
                'item': item,
                'status': self.NOT_STARTED,
                'reminder': reminder
            }
        except Exception as e:
            raise Exception('Error: ', e)

    def delete_item(self, id):
        try:
            self.connect_db()
            cursor = self.connection.cursor()
            fetch_status = self.get_item(id)
            if fetch_status.fetchone()[0] == 0:
                raise TypeError("Item Dosen't Exist")
            rows = cursor.execute('DELETE FROM items WHERE id=?',(id,))
            self.connection.commit()
            return rows
        except Exception as e:
            raise Exception('Error: ', e)

    def update_item(self,data, id):
        try:
            self.connect_db()
            cursor = self.connection.cursor()
            fetch_status = self.get_item(id)
            if fetch_status.fetchone()[0] == '':
                raise TypeError("Item Dosen't Exist")
            for key, value in data.items():
                rows = cursor.execute(f'UPDATE items SET {key}=? WHERE id=?', (value, id ))
            self.connection.commit()
            return rows
        except Exception as e:
            raise Exception('Error: ', e)

    def save_data_to_file(self):
        try:
            self.connect_db()
            rows = self.get_all_items()
            return rows
        except Exception as e:
            raise Exception('Error: ',e)




