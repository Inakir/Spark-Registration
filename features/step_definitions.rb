require 'spec_helper'

##Given
Given (/^I am on the registration home page\.$/) do
  Visit '/'
end

##Then
Then(/^I should see the text "([^"]*)"$/) do |arg1|
  page.should have arg1
end

Then(/^I should see a link that says "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
