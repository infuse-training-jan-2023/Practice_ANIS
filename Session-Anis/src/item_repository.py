import sqlite3

class ItemRepositiory:
    NOT_STARTED = "Not Started"
    DBPATH = './todo.db'

    @staticmethod
    def connect_db():
        return sqlite3.connect(ItemRepositiory.DBPATH)

    @staticmethod
    def get_all_items():
        try:
            conn = ItemRepositiory.connect_db()
            c = conn.cursor()
            rows = c.execute('select * from items')
            print("Rows Value: " ,rows)
            return rows
        except Exception as e:
            raise Exception('Error: ',e)

    @staticmethod
    def add_items(item, reminder):
        try:
            conn = ItemRepositiory.connect_db()
            c = conn.cursor()
            insert_cursor = c.execute('insert into items (item, status,reminder) VALUES (?,?,?)',
            (item, ItemRepositiory.NOT_STARTED, reminder))
            conn.commit()
            return
            {
                'id': insert_cursor.lastrowid,
                'item': item,
                'status': ItemRepositiory.NOT_STARTED,
                'reminder': reminder
            }
        except Exception as e:
            raise Exception('Error: ', e)
