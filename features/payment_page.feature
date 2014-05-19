Feature: the payment page

  Scenario: showing the payment page
    Given members, payments and months are in the database
    When  I visit the payment page
    Then  I see all the members

  @wip
  Scenario: member makes a payment
    Given members, payments and months are in the database
    When  I visit the payment page
    And   I enter the amount that has been payed by a member
    And   I click the add button
    Then  the member should have a new payment
