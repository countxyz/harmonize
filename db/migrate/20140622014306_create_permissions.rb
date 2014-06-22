class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.timestamps null: false

      t.integer :user_id
      t.integer :thing_id
      t.string  :thing_type, null: false
      t.string  :action,     null: false
    end
  end
end
