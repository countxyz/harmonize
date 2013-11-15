class AddDetailsToProjects < ActiveRecord::Migration
  def change
    add_index :projects, :name
    add_column :projects, :role, :string
  end
end
