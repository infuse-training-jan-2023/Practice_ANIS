from src.api_request import fetch_todo


response = {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": False
}

def test_validate_api_response(mocker):
    mock = mocker.patch('src.api_request.fetch_todo', return_value=response)
    item_return = fetch_todo(1)
    assert item_return == response

def test_validate_invalid_api_response(mocker):
    mock = mocker.patch('src.api_request.fetch_todo', return_value="Number should be between 1 to 200")
    item_return = fetch_todo(201)
    assert item_return == "Number should be between 1 to 200"
