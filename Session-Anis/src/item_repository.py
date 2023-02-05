import sqlite3
import csv

class ItemRepository:
	NOT_STARTED = "Not Started"
	DBPATH = './todo.db'

	@staticmethod
	def connect_db():
		return sqlite3.connect(ItemRepository.DBPATH)

	@staticmethod
	def get_all_items():
		try:
			conn = ItemRepository.connect_db()
			c = conn.cursor()
			rows = c.execute('select * from items')
			print("Rows Value: " ,rows)
			return rows
		except Exception as e:
			raise Exception('Error: ',e)

	@staticmethod
	def get_item(id):
		try:
			conn = ItemRepository.connect_db()
			c = conn.cursor()
			rows = c.execute('select * from items where id=?',(id,))
			print("Rows Value: " ,rows)
			return rows
		except Exception as e:
			raise Exception('Error: ',e)

	@staticmethod
	def add_item(item, reminder):
		try:
			conn = ItemRepository.connect_db()
			c = conn.cursor()
			insert_cursor = c.execute('insert into items (item, status,reminder) VALUES (?,?,?)',
			(item, ItemRepository.NOT_STARTED, reminder))
			conn.commit()
			return{
				'id': insert_cursor.lastrowid,
				'item': item,
				'status': ItemRepository.NOT_STARTED,
				'reminder': reminder
			}
		except Exception as e:
			raise Exception('Error: ', e)

	@staticmethod
	def delete_item(id):
		try:
			conn = ItemRepository.connect_db()
			c = conn.cursor()
			fetch_status = c.execute('select item from items where id=?', (id, ))
			if fetch_status.fetchone()[0] == 0:
				raise TypeError("Item Dosen't Exist")
			rows = c.execute('DELETE FROM items WHERE id=?',(id,))
			conn.commit()
			print("Rows value:",rows)
			return rows
		except Exception as e:
			raise Exception('Error: ', e)

	@staticmethod
	def update_item(data, id):
		print(id)
		print(data)
		try:
			conn = ItemRepository.connect_db()
			c = conn.cursor()
			fetch_status = c.execute('select id from items where id=?', (id, ))
			if fetch_status.fetchone()[0] == '':
				raise TypeError("Item Dosen't Exist")
			for key, value in data.items():
				rows = c.execute(f'UPDATE items SET {key}=? WHERE id=?', (value, id ))
			conn.commit()
			print("Rows value:",rows)
			return rows
		except Exception as e:
			raise Exception('Error: ', e)

	@staticmethod
	def add_user(name, address, mob):
		try:
			conn = ItemRepository.connect_db()
			c = conn.cursor()
			insert_cursor = c.execute('insert into Users (name, address, mobile) VALUES (?,?,?)',
			(name, address, mob))
			conn.commit()
			return{
				'id': insert_cursor.lastrowid,
				'name': name,
				'address': address,
				'mobile': mob
			}
		except Exception as e:
			raise Exception('Error: ', e)

	@staticmethod
	def save_data_to_file():
		try:
			conn = ItemRepository.connect_db()
			c = conn.cursor()
			rows = c.execute('select * from items')
			print("Rows Value: " ,rows)
			fields = ['ID', 'ITEM', 'STATUS', 'REMINDER']
			# writing to csv file
			with open('ItemsRecords.csv', 'w') as csvfile:
				# creating a csv writer object
				csvwriter = csv.writer(csvfile)
				# writing the fields
				csvwriter.writerow(fields)

				# writing the data rows
				csvwriter.writerows(rows)

			return rows
		except Exception as e:
			raise Exception('Error: ',e)




