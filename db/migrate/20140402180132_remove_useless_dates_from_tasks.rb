class RemoveUselessDatesFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :start_date,  :datetime
    remove_column :tasks, :target_date, :datetime
  end
end
