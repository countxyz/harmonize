class RemoveDetailsFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :status, :string
    remove_column :projects, :priority, :string
    remove_column :projects, :role, :string
    remove_column :projects, :start_date, :date
    remove_column :projects, :target_date, :date
    remove_column :projects, :deadline, :date
    remove_column :projects, :completion_date, :date
  end
end
