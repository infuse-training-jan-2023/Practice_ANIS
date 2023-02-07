from src.item_repository import ItemRepository

item_repo = ItemRepository

items = [(4, 'Test Started', 'Not started', 0)]

def test_add_item(mocker):
    mock = mocker.patch('src.item_repository.ItemRepository.add_item', return_value=items)
    item_returned = item_repo.add_item('Test Started', 0)
    assert item_returned == items
