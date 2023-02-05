Feature: Update item
    As a user I can update an item to database

    Scenario: Update item
    When I update item
    Then item should get updated
    Then the api status code should be 201
    Then the api response content type should be json
