require_relative '../../spec/spec_helper'
require_relative '../../spec/rails_helper'
require 'rubygems'
require 'test/unit'

include Test::Unit::Assertions

require 'simplecov'
SimpleCov.start

Before do |scenario|
  if Admin.count == 0
    load Rails.root.join('db/seeds.rb')
  end
end

######################################Given

Given(/^we are on the admins new page\.$/) do
  visit 'admins/new'
end

Given (/^I am on the registration home page\.$/) do
  visit '/'
end

Given(/^I am on the elementary school registration page\.$/) do
  visit '/student_users/new?student_level=Elementary'
end

######################################When
When(/^I click the link, "([^"]*)"$/) do |arg1|
  first(:link, arg1).click
end

When(/^I fill "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in "#{arg1}", :with => arg2
end

When(/^I click the button, "([^"]*)"$/) do |arg1|
  click_button(arg1, match: :first)
end

######################################Then

Then(/^I should see a link that says "([^"]*)"$/) do |text|
  page.should have_link text
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  page.should have_text arg1
end

Then(/^I should be on the "([^"]*)" page.$/) do |arg1|
  assert page.current_path == '/login'
end

Then (/^I should receive a file\.$/) do
  page.response_headers["Content-Disposition"].should == "attachment"
end