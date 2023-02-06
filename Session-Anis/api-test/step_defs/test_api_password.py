
import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/validate_password.feature')

validate_pass_url = "http://127.0.0.1:5000/validate_pass"
passd = {"pass": "Anis@shaikh"}

@when('I send the password')
def validate_password():
  pytest.api_response = requests.post(validate_pass_url, json=passd)

@then('password should get validated')
def check_password_validated():
  data = pytest.api_response.json()
  assert type(data) == dict

@then('the api status code should be 200')
def check_status_code():
  assert pytest.api_response.status_code == 200

@then('the api response content type should be json')
def check_content_type():
  assert pytest.api_response.headers['Content-type'] == 'application/json'
