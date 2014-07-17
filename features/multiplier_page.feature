Feature: anything to do with the multiplier page
  Scenario: showing the multiplier page
    Given I am logged in as an administrator
    Given members, payments and dues are in the database
    When  I click the multiplier navbar link
    Then  I should see the multipliers for each user
    And   I am able to edit each users' multiplier
    Then  the new multiplier will be saved
