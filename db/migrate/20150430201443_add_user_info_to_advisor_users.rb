class AddUserInfoToAdvisorUsers < ActiveRecord::Migration
  def change
    add_column :advisor_users, :first_name, :string
    add_column :advisor_users, :last_name, :string
    add_column :advisor_users, :school_name, :string
    add_column :advisor_users, :school_level, :string
    add_column :advisor_users, :pay_code, :string
  end
end
