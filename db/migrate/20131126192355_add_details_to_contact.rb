class AddDetailsToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :secondary_email, :string
    add_column :contacts, :notes, :text
    remove_column :contacts, :phone, :string
  end
end
