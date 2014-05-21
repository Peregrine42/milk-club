Feature: a page to change the current recuring fee

  Scenario: the fee must be changed
    When I visit the fees page
    And  I change the fee to a new value
    Then the new fee is confirmed
