
Feature: Validate email
  As a user I can validate email

  Scenario: Validate email
    When I send the email
    Then email should get validated
    Then the api status code should be 200
    Then the api response content type should be json
