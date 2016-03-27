class AddUserTypeToStudentUsers < ActiveRecord::Migration
  def change
    add_column :student_users, :usertype, :string
  end
end
