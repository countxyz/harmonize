class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name,  :string
    add_column :users, :role,       :string
    add_column :users, :phone,      :string
    add_column :users, :google,     :string
    add_column :users, :skype,      :string
    add_column :users, :admin,      :boolean, default: false
  end
end
