=begin
require 'test_helper'

class StudentTest < ActiveSupport::TestCase
    fixtures :student_users, :students
	test "Students need the following attributes" do 
	student_user = StudentUser.new 
		assert student_user.invalid? 
		assert student_user.errors[:first_name].any? 
		assert student_user.errors[:last_name].any? 
		assert student_user.errors[:school_level].any?
		assert student_user.errors[:school_name].any?
	end
	
	def new_student_user(first_name, last_name, school_level, school_name)
	    StudentUser.new(first_name: first_name,
	                    last_name: last_name,
	                    school_level: school_level,
	                    school_name: school_name)
	end
end
=end