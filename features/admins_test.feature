Feature: This should not work
  
Scenario: Forcefully creating a new admin
  Given we are on the admins new page.
  When I click the link, "Login"
  And I fill "session[email]" with "austinktang@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Create a New Admin"
  And I fill "admin[email]" with "admin@gmail.com"
  And I fill "admin[password]" with "test123"
  And I fill "admin[password_confirmation]" with "test123"
  Then I click the button, "Create Admin"
  
  Scenario: Admin wants to navigate back to index page.
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "austinktang@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Admin Information"
  And I click the button, "Back"
  Then I should see "Admin Information"
  
Scenario: Admin wants to send email to all unpaid users
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "admin@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Advisor & Student Information"
  And I click the button, "Email All Unpaid Users"
  And I click the button, "Submit email"
  Then I should see "Advisor Users"
  
  Scenario: Admin wants to send email to all paid users
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "admin@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Advisor & Student Information"
  And I click the button, "Email All Paid Users"
  And I click the button, "Submit email"
  Then I should see "Advisor Users"
  
  Scenario: Admin wants to remind unpaid users
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "admin@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Advisor & Student Information"
  And I click the button, "payment reminder email"
  Then I should see "Advisor Users"
  
  Scenario: Admin wants to return to the home page
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "admin@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Advisor & Student Information"
  And I click the button, "Return Home"
  Then I should see "Advisor & Student Information"  

Scenario: Admin wants to send email to one unpaid user
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "admin@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Advisor & Student Information"
  And I click the button, "send email"
  And I click the button, "Submit email"
  Then I should see "Advisor Users"

Scenario: Admin wants to mark user as unpaid
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "admin@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Advisor & Student Information"
  And I click the button, "Mark Unpaid"
  Then I should see "Advisor Users"

Scenario: Admin wants to send email to all users
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "admin@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Advisor & Student Information"
  And I click the button, "Email All Users"
  And I click the button, "Submit email"
  Then I should see "Advisor Users"
  
Scenario: Admin wants to mark user as paid
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "admin@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Advisor & Student Information"
  And I click the button, "Mark Paid"
  Then I should see "Advisor Users"
  
  Scenario: Admin wants to download a spreadsheet
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "admin@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Advisor & Student Information"
  And I click the link, "CSV"
  Then I should receive a file.
  
  Scenario: Admin wants to logout
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "admin@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the button, "Logout"
  Then I should see "SPARK Registration"
  
  Scenario: Admin wants to change his or her email information
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "admin@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Change Email"
  And I fill "admin[email]" with "bostonjlang@gmail.com"
  And I click the button, "Update Admin"
  Then I should see "Admin email was successfully updated!"
  
  Scenario: Admin fails to change his or her password information
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "bostonjlang@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Change Password"
  And I fill "admin[password]" with "password123"
  And I fill "admin[password_confirmation]" with "password"
  And I click the button, "Update Admin"
  Then I should see "Password must be at least 6 characters long and must match confirmation"
  
  Scenario: Admin wants to change his or her password information
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "bostonjlang@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Change Password"
  And I fill "admin[password]" with "password123"
  And I fill "admin[password_confirmation]" with "password123"
  And I click the button, "Update Admin"
  Then I should see "Admin password was successfully updated!"