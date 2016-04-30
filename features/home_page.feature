Feature: Have the basic registration home page running

  Scenario: Look for Admin Login link.
    Given I am on the registration home page.
	  Then I should see a link that says "Admin Login"
	
	Scenario: Begin register as Elementary Schooler
	  Given I am on the registration home page.
	  When I click the link, "Elementary School Registration"
	  Then I should see "First name"
	  And I should see "Last name"
	  And I should see "Email"
	  And I should see "Password"
	  And I should see "School name"
	
	Scenario: Register as Elementary Schooler
	  Given I am on the elementary school registration page.
	  When I fill "student_user[first_name]" with "Eric"
	  And I fill "student_user[last_name]" with "Ramon"
	  And I fill "student_user[email]" with "Eric15@yahoo.com"
	  And I fill "student_user[password]" with "444444"
	  And I fill "student_user[password_confirmation]" with "444444"
	  And I fill "student_user[school_name]" with "TAMU"
	  And I click the button, "Register Student"
	  Then I should see "Eric"
	  And I should see "Ramon"
	  And I should see "Eric15@yahoo.com"
	  And I should see "TAMU"
	  And I should see a link that says "Continue"
	  
	Scenario: Login as Elementary Schooler
	 Given I am on the registration home page.
	 When I click the link, "Login"
	 And I fill "session[email]" with "Eric10@yahoo.com"
	 And I fill "session[password]" with "444444"
	 And I click the button, "Log in"
	 Then I should be on the "admins/see_info" page.
	# Then I should see "Successfully Logged in!"