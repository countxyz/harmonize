class RemoveDetailsFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :name,            :string
    remove_column :tasks, :start_date,      :date
    remove_column :tasks, :target_date,     :date
    remove_column :tasks, :deadline,        :date
    remove_column :tasks, :completion_date, :date
  end
end
