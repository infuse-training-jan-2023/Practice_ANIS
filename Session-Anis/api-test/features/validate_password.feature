
Feature: Validate password
  As a user I can validate password

  Scenario: Validate password
    When I send the password
    Then password should get validated
    Then the api status code should be 200
    Then the api response content type should be json
