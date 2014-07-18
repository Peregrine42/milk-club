Feature: a page to change the current recuring fee

  Scenario: the fee must be changed
    Given I am logged in as an administrator
    When  I visit the fees page
    And   I change the fee to a new value
    Then  the new fee is confirmed

  Scenario: the fee cannot be below zero
    Given I am logged in as an administrator
    When  I visit the fees page
    And   I change the fee to a value below zero
    Then  the fee is denied

