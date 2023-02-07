
import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/validate_email.feature')

validate_email_url = "http://127.0.0.1:5000/validate_email"
email = {"email": "test123@gmail.com"}

@when('I send the email')
def validate_email():
  pytest.api_response = requests.post(validate_email_url, json=email)

@then('email should get validated')
def check_email_validated():
  data = pytest.api_response.json()
  assert type(data) == dict

@then('the api status code should be 200')
def check_status_code():
  assert pytest.api_response.status_code == 200

@then('the api response content type should be json')
def check_content_type():
  assert pytest.api_response.headers['Content-type'] == 'application/json'
