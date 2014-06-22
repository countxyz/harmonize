class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps null: false

      t.string  :handle,          null: false
      t.string  :first_name,      null: false, default: ''
      t.string  :last_name,       null: false, default: ''
      t.string  :password_digest, null: false
      t.boolean :admin,           null: false, default: false
      t.string  :slug,            null: false
    end
    add_index :users, :handle, unique: true
    add_index :users, :slug,   unique: true
  end
end
