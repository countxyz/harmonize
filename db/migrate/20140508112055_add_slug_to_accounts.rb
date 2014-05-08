class AddSlugToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :slug, :string
    add_index  :accounts, :slug, unique: true
  end
end
