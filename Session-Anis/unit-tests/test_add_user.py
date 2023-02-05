from src.item_repository import ItemRepository

item_repo = ItemRepository
users = [(1, 'Anis', 'Margao', 12345)]

def test_add_user(mocker):
    mock = mocker.patch('src.item_repository.ItemRepository.add_user', return_value=users)
    item_return = item_repo.add_user('Anis', 'Margao', 12345)
    assert item_return == users
