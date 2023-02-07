from item_repository import ItemRepository
import csv

class ItemActions:
	def __init__(self) -> None:
		self.item_repo = ItemRepository()

	def get_all_items(self):
		try:
			items = self.item_repo.get_all_items()
			res = []
			for item in items:
				res.append(
					{
						'id': item[0],
						'item': item[1],
						'status': item[2],
						'reminder': item[3]
					}
				)
			return res
		except Exception as e:
			print(e)
			return {}

	def get_item(self, item):
		try:
			items = self.item_repo.get_item(item)
			res = []
			for item in items:
				res.append(
					{
						'id': item[0],
						'item': item[1],
						'status': item[2],
						'reminder': item[3]
					}
				)
			return res
		except Exception as e:
			print(e)
			return {}

	def add_item(self, item, reminder):
		try:
			item = self.item_repo.add_item(item, reminder)
			return item
		except Exception as e:
			print(e)
			return {}

	def delete_item(self, id):
		try:
			items = self.item_repo.delete_item(id)
			res = {"msg": "Item Deleted Successfully"}
			return res
		except Exception as e:
			print(e)
			return {}

	def update_item(self, data, id):
		try:
			items = self.item_repo.update_item(data, id)
			res = {"msg": "Item Updated Successfully"}
			return res
		except Exception as e:
			print(e)
			return {}

	def add_user(self, name, address, mob):
		try:
			item = self.item_repo.add_user(name, address, mob)
			return item
		except Exception as e:
			print(e)
			return {}

	def save_data_to_file(self):
		try:
			items = self.item_repo.save_data_to_file()
			fields = ['ID', 'ITEM', 'STATUS', 'REMINDER']
			# writing to csv file
			with open('ItemsRecords.csv', 'w') as csvfile:
				# creating a csv writer object
				csvwriter = csv.writer(csvfile)
				# writing the fields
				csvwriter.writerow(fields)

				# writing the data rows
				csvwriter.writerows(items)
			return {"msg": "File Created successfully"}
		except Exception as e:
			print(e)
			return {}
