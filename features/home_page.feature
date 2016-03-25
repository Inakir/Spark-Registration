Feature: Have the basic registration home page running

  Scenario: Visit home registration page.
    Given I am on the registration home page.
	Then I should see the text "SPARK Registration"

  Scenario: Look for Admin Login link.
    Given I am on the registration home page.
	Then I should see a link that says "Admin Login"
	
