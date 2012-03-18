Feature: Post-deployment smoke test (runs against Heroku server)

  @javascript
  @heroku
  Scenario: E2E confidence test

    When I visit the live site
    And I log in
    Then I should see some suggested sessions
