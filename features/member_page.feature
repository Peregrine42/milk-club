Feature: anything to do with my account

  Scenario: showing the my account page
    Given I am logged in
      And members, payments and dues are in the database
    When  I visit the home page
     And  I click the my account navbar link
    Then  I see my name, amount due, amount paid and balance
