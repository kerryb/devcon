Feature: Suggest a session

  Scenario: Successfully submit a session suggestion
    When I suggest a session
    Then my session suggestion should appear on the home page
