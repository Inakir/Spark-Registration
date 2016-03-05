require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @admins = Admin.new(email: "admin@domain.com", password: "password", password_confirmation: "password")
  end

  test "Should Be Valid" do
    assert @admins.valid?
  end
  test "email should be present" do
    @admins.email = "     "
    assert_not @admins.valid?
  end
  test "email should not be too long" do
    @admins.email = "a" * 244 + "@example.com"
    assert_not @admins.valid?
  end

  test "email/email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @admins.email = valid_address
      assert @admins.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @admins.email = invalid_address
      assert_not @admins.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @admins.dup
    duplicate_user.email = @admins.email.upcase
    @admins.save
    assert_not duplicate_user.valid?
  end

  test "password should not equal password_confirmation" do
    @admins.password_confirmation = "thisisnotmypassword"
    assert_not @admins.valid?
  end


  test "password should have a minimum length" do
    @admins.password = @admins.password_confirmation = "a" * 5
    assert_not @admins.valid?
  end
end
