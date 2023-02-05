
from src.item_repository import ItemRepository

items = [
    (3, 'Go to Shooping', 'Not Started', 1),
    (5, 'Completed Task', 'Not Started', 0),
]

item_repo = ItemRepository()

def test_get_all_items_makes_db_call(mocker):
  mock = mocker.patch('src.item_repository.ItemRepository.get_all_items', return_value = [])
  _ = item_repo.get_all_items()
  assert mock.call_count == 1

def test_get_all_items(mocker):
  mock = mocker.patch('src.item_repository.ItemRepository.get_all_items', return_value = items)
  item_returned = item_repo.get_all_items()
  for i, item in enumerate(item_returned):
    assert item == items[i]
