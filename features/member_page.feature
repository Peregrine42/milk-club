Feature: showing member payment history

  @wip
  Scenario: a member has logged in successfully
    Given I am logged in
    And   my payment history is in the database
    When  I visit the members page
    Then  I should see my payment history
