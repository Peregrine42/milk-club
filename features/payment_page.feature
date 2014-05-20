Feature: the payment page

  Scenario: showing the payment page
    Given members, payments and dues are in the database
    When  I visit the payment page
    Then  I see all the members

  Scenario: member makes a payment
    Given members, payments and dues are in the database
    When  I visit the payment page
    And   I enter the amount that has been payed by a member
    And   I click the add button
    Then  the member should have a new payment

  Scenario: member does not need to pay for a month
    Given members, payments and dues are in the database
    And   an amount due for the month is in the database
    When  I visit the payment page
    And   I check the skip payment box
    And   I click the add button
    Then  the member should have no payment due for that month
