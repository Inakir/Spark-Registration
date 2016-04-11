Feature: This should not work
  

Scenario: Forcefully creating a new admin
  Given we are on the admins new page.
  When I fill "admin[email]" with "eramon224@tamu.edu"
  And I fill "admin[password]" with "444444"
  And I fill "admin[password_confirmation]" with "4444444"
  Then I click the button, "Create Admin"
  
Scenario: Admin cannot login
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "austinktang@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Advisor & Student Information"
  And I click the button, "Email All Unpaid Users"
  