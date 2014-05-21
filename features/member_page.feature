Feature: showing member payment history

  @wip
  Scenario: a member has logged in successfully
    Given members, payments and dues are in the database
    And   I am logged in
    When  I visit the members page
    Then  I should see my payment history
