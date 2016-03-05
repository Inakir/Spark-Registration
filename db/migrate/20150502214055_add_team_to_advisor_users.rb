class AddTeamToAdvisorUsers < ActiveRecord::Migration
  def change
    add_column :advisor_users, :team_name, :string
    add_column :advisor_users, :team_code, :string
  end
end
