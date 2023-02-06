import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/delete_item.feature')

delete_item_url = "http://127.0.0.1:5000/items/32"

@when('I delete an item')
def delete_item():
    pytest.api_response = requests.delete(delete_item_url)
    print(pytest.api_response)

@then('item should get deleted from the database')
def check_status_code():
    data =  pytest.api_response.json()
    assert type(data) == dict

@then('the api status code should be 201')
def check_status_code():
    assert pytest.api_response.status_code == 201

@then('the api response content type should be json')
def check_content_type():
    assert pytest.api_response.headers['Content-Type'] == 'application/json'
