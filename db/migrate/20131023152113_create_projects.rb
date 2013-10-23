class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :status
      t.string :priority
      t.date :start_date
      t.date :target_date
      t.date :deadline
      t.date :completion_date
      t.text :notes

      t.timestamps
    end
  end
end
