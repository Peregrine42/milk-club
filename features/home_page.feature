Feature: the home page

  Scenario: showing the home page
    Given members, payments and dues are in the database
    When I visit the home page
    Then I see the balance for the members
