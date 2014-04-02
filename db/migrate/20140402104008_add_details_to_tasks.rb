class AddDetailsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :description, :string
    add_column :tasks, :start_date,  :datetime
    add_column :tasks, :target_date, :datetime
    add_column :tasks, :deadline,    :datetime
    add_column :tasks, :completed,   :datetime
  end
end
