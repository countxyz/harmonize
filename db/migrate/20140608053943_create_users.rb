class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps null: false

      t.string  :handle,          null: false
      t.string  :email,           null: false, default: ''
      t.string  :first_name,      null: false, default: ''
      t.string  :last_name,       null: false, default: ''
      t.string  :password_digest, null: false
      t.boolean :admin,           null: false, default: false
    end
    add_index :users, :handle, unique: true
  end
end
