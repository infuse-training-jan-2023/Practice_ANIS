Feature: Delete item
    As a user I can delete an item from database

    Scenario: Delete item
    When I delete an item
    Then item should get deleted from the database
    Then the api status code should be 201
    Then the api response content type should be json
