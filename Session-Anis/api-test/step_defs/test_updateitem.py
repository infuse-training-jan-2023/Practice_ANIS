import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/update_item.feature')

update_item_url = "http://127.0.0.1:5000/items/9"
item = {"item": "Updated", "status": "Progress"}

@when('I update item')
def update_item():
    pytest.api_response = requests.put(update_item_url, json=item)
    print(pytest.api_response)

@then('item should get updated')
def check_status_code():
    data =  pytest.api_response.json()
    assert type(data) == dict

@then('the api status code should be 201')
def check_status_code():
    assert pytest.api_response.status_code == 201

@then('the api response content type should be json')
def check_content_type():
    assert pytest.api_response.headers['Content-Type'] == 'application/json'
