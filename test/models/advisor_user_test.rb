require 'test_helper'

class AdvisorUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @advisor_users = AdvisorUser.new(username: "advisor@domain.com",
                                     password: "password",
                                     first_name: "Jake", last_name: "Wier",
                                     school_name: "Brooks Wester Middle School",
                                     school_level: "Middle",
                                     pay_code: "Y1234")
  end

  test "Should Be Valid" do
    assert @advisor_users.valid?
  end
  test "username should be present" do
    @advisor_users.username = "     "
    assert_not @advisor_users.valid?
  end
  test "username should not be too long" do
    @advisor_users.username = "a" * 244 + "@example.com"
    assert_not @advisor_users.valid?
  end

  test "first_name should be present" do
    @advisor_users.first_name = "     "
    assert_not @advisor_users.valid?
  end
  test "first_name should not be too long" do
    @advisor_users.first_name = "a" * 61
    assert_not @advisor_users.valid?
  end

  test "last_name should be present" do
    @advisor_users.last_name = "     "
    assert_not @advisor_users.valid?
  end
  test "last_name should not be too long" do
    @advisor_users.last_name = "a" * 61
    assert_not @advisor_users.valid?
  end

  test "school_name should be present" do
    @advisor_users.school_name = "     "
    assert_not @advisor_users.valid?
  end
  test "school_name should not be too long" do
    @advisor_users.school_name = "a" * 101
    assert_not @advisor_users.valid?
  end

  test "school_level should be present" do
    @advisor_users.school_level = "     "
    assert_not @advisor_users.valid?
  end
  test "assert false school_level should only be Elementary, Middle, or High" do
    @advisor_users.school_level = "Intermediate"
    assert_not @advisor_users.valid?
  end
  test "assert true school_level should only be Elementary, Middle, or High" do
    @advisor_users.school_level = "Elementary"
    assert @advisor_users.valid?
  end
  
  test "pay_code should be present" do
    @advisor_users.pay_code = "     "
    assert_not @advisor_users.valid?
  end

  test "username/email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @advisor_users.username = valid_address
      assert @advisor_users.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "username/email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @advisor_users.username = invalid_address
      assert_not @advisor_users.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @advisor_users.dup
    duplicate_user.username = @advisor_users.username.upcase
    @advisor_users.save
    assert_not duplicate_user.valid?
  end
end
