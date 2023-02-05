
Feature: Add user
  As a user I can add user to user table

  Scenario: Add user
    When I add user
    Then user should get added to database
    Then the api status code should be 201
    Then the api response content type should be json
