Feature: Suggest a session

  Scenario: Successfully submit a session suggestion
    When I visit the site
    And I suggest a session
    Then my session suggestion should appear on the home page
