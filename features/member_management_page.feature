Feature: member management

  Scenario: adding a new member
    Given I am logged in as an administrator
    When  I visit the new member page
    And   I fill in the new member details
    Then  the new member is in the database

  Scenario: editing an existing member
    Given I am logged in as an administrator
    And   members, payments and dues are in the database
    When  I visit the edit page for a member
    And   I change some details
    Then  the details in the database will change

  Scenario: deleting a member
    Given I am logged in as an administrator
    And   members, payments and dues are in the database
    When  I vist the member page
    And   I click the delete button
    Then  I should recieve a confirmation message
