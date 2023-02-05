from src.item_repository import ItemRepository

item_repo = ItemRepository
items = [(2, 'Updated')]

def test_update_item(mocker):
    mock = mocker.patch('src.item_repository.ItemRepository.update_item', return_value=items)
    item_return = item_repo.update_item(1)
    assert item_return == items
