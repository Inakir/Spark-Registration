class AddPayStatusToStudentUsers < ActiveRecord::Migration
  def change
    add_column :student_users, :pay_status, :string
  end
end