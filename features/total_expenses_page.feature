Feature: anything to do with the total expenses

  Scenario: showing the total expenses page
    Given I am logged in as an administrator
      And members, payments and dues are in the database
    When  I visit the home page
      And  I click the total expenses navbar link
    Then  I see the total balance for the month
      And I see the expected balance for the month

  Scenario:
    Given I am logged in as an administrator
      And members, payments and dues are in the database
    When  I visit the home page
      And  I click the total expenses navbar link
    Then  I see the total due for the month for each user
      And I see the total balance for the month for each user
