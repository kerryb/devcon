Feature: Login

  Scenario: Content not visible unless logged in
    When I visit the site
    Then I should be redirected to the login page

  Scenario: Log in
    When I visit the site
    And I log in
    Then I should be on the home page

  Scenario: Log out
    Given I am logged in
    When I log out
    And I visit the home page
    Then I should be redirected to the login page
    And I should not be logged in

  Scenario: Redirected to requested page after login
    When I visit the new session page
    And I log in
    Then I should be redirected to the new session page
