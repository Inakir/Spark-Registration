Feature: This should not work
  
Scenario: Forcefully creating a new admin
  Given we are on the admins new page.
  When I fill "admin[email]" with "eramon224@tamu.edu"
  And I fill "admin[password]" with "444444"
  And I fill "admin[password_confirmation]" with "4444444"
  Then I click the button, "Create Admin"
  
Scenario: Admin wants to send email to all unpaid users
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "austinktang@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Advisor & Student Information"
  And I click the button, "Email All Unpaid Users"
  And I click the button, "Submit email"
  Then I should see "Advisor Users"

Scenario: Admin wants to send email to one unpaid user
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "austinktang@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Advisor & Student Information"
  And I click the button, "send email"
  And I click the button, "Submit email"
  Then I should see "Advisor Users"

Scenario: Admin wants to destroy user
  Given I am on the registration home page.
  When I click the link, "Login"
  And I fill "session[email]" with "austinktang@gmail.com"
  And I fill "session[password]" with "test123"
  And I click the button, "Log in"
  And I click the link, "Advisor & Student Information"
  And I click the link, "Destroy"
  And I expect to click "OK" on a confirmation box saying "Are you sure?"
  Then I should see "Student user was successfully destroyed."
  
# Scenario: Admin wants to see list of users
# Given I am on the registration home page.
# When I click the link, "Login"
# And I fill "session[email]" with "austinktang@gmail.com"
# And I fill "session[password]" with "test123"
# And I click the button, "Log in"
# And I click the link, "Advisor & Student Information"
# And I click the link, "CSV"
# Then I should get a download with the filename "student_users.csv"