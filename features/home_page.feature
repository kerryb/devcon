Feature: Home page

  Scenario: Suggested sessions are shown on the home page
    Given some sessions have been suggested
    When I visit the site
    Then I should see the suggested session titles
