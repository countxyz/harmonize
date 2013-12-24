class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :starttime
      t.datetime :endtime
      t.boolean :all_day, default: false
      t.text :description

      t.timestamps
    end
  end
end
