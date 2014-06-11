class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.timestamps null: false

      t.integer :user_id,    null: false
      t.integer :thing_id,   null: false
      t.string  :thing_type, null: false
      t.string  :action,     null: false
    end
  end
end
