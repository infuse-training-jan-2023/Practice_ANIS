import sqlite3

connection = sqlite3.connect('todo.db')

with open('DB/schema.sql') as f:
    connection.executescript(f.read())

cursor = connection.cursor()

cursor.execute("INSERT INTO items (item, status,reminder) VALUES (?,?,?)",
    ('Go to musem', 'Not Started', True)
)


cursor.execute("INSERT INTO items (item, status,reminder) VALUES (?,?,?)",
    ('Complete Assignments', 'In Progress', True)
)

connection.commit()
connection.close()
