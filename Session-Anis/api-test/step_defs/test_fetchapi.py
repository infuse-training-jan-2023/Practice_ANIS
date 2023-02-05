
import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/fetch_api.feature')

api_url = "http://127.0.0.1:5000/api/1"

@when('I send the api request')
def fetch_api():
  pytest.api_response = requests.get(api_url)

@then('I should get api response')
def check_resposne_returned():
  data = pytest.api_response.json()
  assert type(data) == dict

@then('the api status code should be 200')
def check_status_code():
  assert pytest.api_response.status_code == 200

@then('the api response content type should be json')
def check_content_type():
  assert pytest.api_response.headers['Content-type'] == 'application/json'
