class AddUserIdToTeams < ActiveRecord::Migration
  def change
    add_reference :teams, :advisor_user
    add_foreign_key :teams, :advisor_users
  end
end
