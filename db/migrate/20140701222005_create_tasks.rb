class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.timestamps null: false

      t.string   :description, null: false
      t.datetime :deadline
      t.datetime :completed
    end
    add_reference :tasks, :user, index: true
  end
end