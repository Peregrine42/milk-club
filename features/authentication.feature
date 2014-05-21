Feature: Authenticating oneself on the site

  Scenario: Logging in with valid iuser credentials
    Given I am on the login page
    When  I log in with valid iuser credentials
    Then  I should see my name in the page header

  Scenario: (Not) Logging in with invalid credentails
    Given I am on the login page
    When  I attempt to log in with invalid credentials
    Then  I should still be on the login page
      And I should see that my credentials were invalid

  Scenario: (Not) Logging in with valid credentails but the user is not in the database
    Given I am on the login page
    When  I attempt to log in with valid credentials but the user is not in the database
    Then  I should still be on the login page
      And I should see that I do not have permission to log in

  Scenario: Logging in as an admin
    Given I am on the login page
    When  I log in as an admin
    Then  I should see that I am an admin

  Scenario: Logging out
    Given I am logged in
    When  I log out
    Then  I should be on the login page
