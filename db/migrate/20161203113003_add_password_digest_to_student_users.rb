class AddPasswordDigestToStudentUsers < ActiveRecord::Migration
  def change
    add_column :student_users, :password_digest, :string
  end
end
