class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.timestamps null: false

      t.string :name,    null: false
      t.string :website, null: false, default: ''
      t.text   :notes,   null: false, default: ''
      t.string :slug,    null: false      
    end
    add_index     :accounts, :slug, unique: true
    add_reference :accounts, :user, index: true
  end
end