class AddPasswordToStudentUsers < ActiveRecord::Migration
  def change
    add_column :student_users, :password, :string
  end
end
