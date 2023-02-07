
Feature: Get item
    As a user I can get a particular item

    Scenario: Get item
    When I search for a particular item
    Then I should get an item present
    Then the api status code should be 200
    Then the api response content type should be json
