require_relative '../../spec/spec_helper'
require_relative '../../spec/rails_helper'
######################################Given
Given (/^I am on the registration home page\.$/) do
  visit '/'
end

Given(/^I am on the elementary school registration page\.$/) do
  visit '/student_users/new?student_level=Elementary'
end

Given(/^I am on the middle school registration page\.$/) do
  visit '/student_users/new?student_level=Middle'
end

######################################When
When(/^I click the link, "([^"]*)"$/) do |arg1|
  click_link(arg1)
end

When(/^I fill "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in "#{arg1}", :with => arg2
end

When(/^I click the button, "([^"]*)"$/) do |arg1|
  click_button(arg1)
end

######################################Then

Then(/^I should see a link that says "([^"]*)"$/) do |text|
  page.should have_link text
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  page.should have_text arg1
end

Then(/^I should click the link, "([^"]*)"$/) do |arg1|
  click_link(arg1)
end

Then(/^I should go back home.$/) do
  visit '/'
end

Then(/^I should click the button, "([^"]*)"$/) do |arg1|
  click_button(arg1)
end