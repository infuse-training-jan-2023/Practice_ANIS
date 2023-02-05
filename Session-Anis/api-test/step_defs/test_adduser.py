
import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/add_user.feature')

add_user_url = "http://127.0.0.1:5000/user"
user = {"name": "Test user", "address": "Panjim", "mobile": 123456}

@when('I add user')
def get_all_items():
  pytest.api_response = requests.post(add_user_url, json=user)

@then('user should get added to database')
def check_the_items_returned():
  user_data = pytest.api_response.json()
  assert type(user_data) == dict

@then('the api status code should be 201')
def check_status_code():
  assert pytest.api_response.status_code == 201

@then('the api response content type should be json')
def check_content_type():
  assert pytest.api_response.headers['Content-type'] == 'application/json'
