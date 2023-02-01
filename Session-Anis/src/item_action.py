from item_repository import ItemRepositiory

class ItemActions:
    def __init__(self) -> None:
        self.item_repo = ItemRepositiory()

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

    def add_item(self, item, reminder):
        try:
            item = self.item_repo.add_items(item, reminder)
            return item
        except Exception as e:
            print(e)
            return {}
