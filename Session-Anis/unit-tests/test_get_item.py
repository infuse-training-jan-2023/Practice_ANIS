from src.item_repository import ItemRepository

item_repo = ItemRepository

item = [(1, 'Chnaged', 'Progress', 1)]
id = 1

def test_get_item(mocker):
    mock = mocker.patch('src.item_repository.ItemRepository.get_item', return_value=item)
    item_returned = item_repo.get_item(id)
    assert item == item_returned
