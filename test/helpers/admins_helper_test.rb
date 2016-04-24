require 'test_helper'

class AdminsHelperTest < ActionView::TestCase
  test "test admins log in" do
    @admins = Admin.new(email: "admin@domain.com", password: "password", password_confirmation: "password")
    assert_equal nil, admin_log_in(@admins)
  end
end