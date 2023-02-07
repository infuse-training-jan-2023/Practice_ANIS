Feature: Add item
    As a user I can add an item to database

    Scenario: Add item
    When I add an item
    Then item should get added to database
    Then the api status code should be 201
    Then the api response content type should be json
