
Feature: Get all items
  As a user I can get all the todo items

  Scenario: Get all items
    When I search for all items
    Then I should get all the items present
    Then the api status code should be 200
    Then the api response content type should be json
