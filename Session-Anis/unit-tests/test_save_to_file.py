from src.item_repository import ItemRepository

item_repo = ItemRepository
items = [(2, 'Updated', 'Started', 0), (5, 'Test', 'Not started', 1)]

def test_save_to_file(mocker):
    mock = mocker.patch('src.item_repository.ItemRepository.save_data_to_file', return_value=items)
    item_return = item_repo.save_data_to_file()
    for i, item in enumerate(item_return):
        assert item == items[i]
