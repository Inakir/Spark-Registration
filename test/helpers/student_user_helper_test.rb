require 'test_helper'

class StudentUsersHelperTest < ActionView::TestCase
  test "test current user function" do
    assert_equal nil, student_current_user
  end
  test "test logged in? function" do
    assert_equal false, student_logged_in?
  end
end