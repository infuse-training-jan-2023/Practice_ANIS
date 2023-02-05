
Feature: Fetch api
  As a user I can fetch api request

  Scenario: Fetch api
    When I send the api request
    Then I should get api response
    Then the api status code should be 200
    Then the api response content type should be json
