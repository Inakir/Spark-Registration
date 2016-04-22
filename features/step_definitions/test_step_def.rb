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
#levelPage = 'student_users/new?student_level=' + arg1.slice(0,1).capitalize + arg1.slice(1..-1)
  #visit levelPage
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
  page.should have_content arg1
end

Then(/^I should be on the "([^"]*)" page\.$/) do |arg1|
  assert page.current_path == '/login'
end
