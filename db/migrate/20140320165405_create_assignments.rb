class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :description
      t.string :status
      t.string :priority
      t.date :start_date
      t.date :target_date
      t.date :deadline
      t.date :completed
    end
  end
end
