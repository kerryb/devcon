Feature: Home page

  Scenario: Proposals are shown on the home page
    Given some proposals have been made
    When I visit the site
    Then I should see the proposal titles
