class AddSlugToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :slug, :string
  end
end
