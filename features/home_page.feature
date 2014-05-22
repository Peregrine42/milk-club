Feature: the home page

  Scenario: showing the home page
    Given I am logged in as an administrator
    Given members, payments and dues are in the database
    When I visit the home page
    Then I see the balance for the members

  Scenario: showing the member's account
    Given I am logged in
    And   my payment history is in the database
    When  I visit the my account page
    Then  I should see my payment history
