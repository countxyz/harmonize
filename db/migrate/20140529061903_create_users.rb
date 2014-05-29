class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps

      t.string :handle,          null: false, unique: true
      t.string :email,           null: false, default: ''
      t.string :first_name,      null: false, default: ''
      t.string :last_name,       null: false, default: ''
      t.string :password_digest, null: false
    end
    add_index :users, :handle, unique: true
  end
end
