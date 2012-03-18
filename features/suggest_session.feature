Feature: Suggest a session

  Scenario: Successfully submit a session suggestion
    Given I am logged in
    When I suggest a session
    Then my session suggestion should appear on the home page
    And the date and time the session was suggested should be displayed
    #And the session should show my name
    #And my name should link to my e-mail address
