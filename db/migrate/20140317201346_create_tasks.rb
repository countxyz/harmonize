class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :start_date
      t.date :target_date
      t.date :deadline
      t.date :completion_date
    end
  end
end
