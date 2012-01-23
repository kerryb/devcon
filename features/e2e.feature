Feature: E2E test (runs against live Heroku server)

  @javascript
  @e2e
  Scenario: E2E confidence test

    When I visit the live site
    Then I should see some proposals
