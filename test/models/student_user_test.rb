require 'test_helper'
class StudentUserTest < ActiveSupport::TestCase
    def setup
      @student_user = StudentUser.new(
                                       first_name: "Jake", last_name: "Wier",
                                       school_name: "Brooks Wester Middle School",
                                       school_level: "Middle",
                                       team_name: "blah blah",
                                       pay_code: "Y1234")
    end

    test "Should Be Valid" do
      assert_not @student_user.valid?,"should be valid"
    end

    test "first_name should be present" do
      @student_user.first_name = "     "
      assert_not @student_user.valid?,"first_name should be present"
    end
    test "first_name should not be too long" do
      @student_user.first_name = "a" * 61
      assert_not @student_user.valid?,"first_name should not be too long"
    end

    test "last_name should be present" do
      @student_user.last_name = "     "
      assert_not @student_user.valid?,"last_name should be present"
    end
    test "last_name should not be too long" do
      @student_user.last_name = "a" * 61
      assert_not @student_user.valid?
    end

    test "school_name should be present" do
      @student_user.school_name = "     "
      assert_not @student_user.valid?
    end
    test "school_name should not be too long" do
      @student_user.school_name = "a" * 101
      assert_not @student_user.valid?
    end

    test "school_level should be present" do
      @student_user.school_level = "     "
      assert_not @student_user.valid?
    end
    test "assert false school_level should only be Elementary, Middle, or High" do
      @student_user.school_level = "Intermediate"
      assert_not @student_user.valid?,"should be in a level"
    end
    test "assert true school_level should only be Elementary, Middle, or High" do
      @student_user.school_level = "Elementary"
      assert @student_user.valid?, "school level should be valid"
    end

    test "pay_code should be present" do
      @student_user.pay_code = "     "
      assert_not @student_user.valid?, "pay code should be valid"
    end

    test "username/email validation should accept valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        assert @student_user.valid?, "#{valid_address.inspect} should be valid"
      end
    end

    test "username/email validation should reject invalid addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        assert_not @student_user.valid?, "#{invalid_address.inspect} should be invalid"
      end
    end

    test "email addresses should be unique" do
      duplicate_user = @student_user.dup
      @student_user.save
      assert_not duplicate_user.valid?, "user should not be duplicate"
    end
end
