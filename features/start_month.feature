Feature: adding new dues for each user to start a new month

  Background:
    Given I am logged in as an administrator

  Scenario: it's the start of the month
    Given the system's database is populated
    When  I visit the new amount due page
    And   I click the add amount due button
    Then  everyone should owe at least the amount added
