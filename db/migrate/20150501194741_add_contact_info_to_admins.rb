class AddContactInfoToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :name, :string
    add_column :admins, :phone, :string
    add_column :admins, :fax, :string
    add_column :admins, :right_sig_url, :string
    add_column :admins, :mkt_place_url, :string
  end
end
