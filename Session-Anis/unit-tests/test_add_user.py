from src.user_repository import UserRepository

user_repo = UserRepository
users = [(1, 'Anis', 'Margao', 12345)]

def test_add_user(mocker):
    mock = mocker.patch('src.user_repository.UserRepository.add_user', return_value=users)
    item_return = user_repo.add_user('Anis', 'Margao', 12345)
    assert item_return == users
