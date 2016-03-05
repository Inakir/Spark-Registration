class AddUsertypeToAdvisorUsers < ActiveRecord::Migration
  def change
    add_column :advisor_users, :usertype, :string
  end
end
