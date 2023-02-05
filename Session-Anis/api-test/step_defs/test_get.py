
import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/get_all_items.feature')

get_all_items_url = "http://127.0.0.1:5000/items"

@when('I search for all items')
def get_all_items():
  pytest.api_response = requests.get(get_all_items_url)

@then('I should get all the items present')
def check_the_items_returned():
  body = pytest.api_response.json()
  for item in body:
    assert type(item) == dict

@then('the api status code should be 200')
def check_status_code():
  assert pytest.api_response.status_code == 200

@then('the api response content type should be json')
def check_content_type():
  assert pytest.api_response.headers['Content-type'] == 'application/json'
