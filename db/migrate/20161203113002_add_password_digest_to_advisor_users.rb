class AddPasswordDigestToAdvisorUsers < ActiveRecord::Migration
  def change
    add_column :advisor_users, :password_digest, :string
  end
end
