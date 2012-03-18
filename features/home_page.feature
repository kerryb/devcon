Feature: Home page

  Scenario: Suggested sessions are shown on the home page
    Given some sessions have been suggested
    And I am logged in
    Then I should see the suggested session titles
