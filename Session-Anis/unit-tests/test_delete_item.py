from src.item_repository import ItemRepository

item_repo = ItemRepository
items = []

def test_delete_item(mocker):
    mock = mocker.patch('src.item_repository.ItemRepository.delete_item', return_value=items)
    item_return = item_repo.delete_item(1)
    assert item_return == items
