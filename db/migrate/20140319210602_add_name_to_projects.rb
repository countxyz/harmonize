class AddNameToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :name, :string
    add_index :projects, :name, unique: true
  end
end
