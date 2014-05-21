Feature: the home page

  Scenario: showing the home page
    Given I am logged in as an administrator
    Given members, payments and dues are in the database
    When I visit the home page
    Then I see the balance for the members
