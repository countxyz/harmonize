class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.timestamps null: false

      t.string  :name,    null: false
      t.string  :website, null: false, default: ''
      t.text    :notes,   null: false, default: ''
      t.boolean :active,  null: false, default: true
      t.string  :slug,    null: false      
    end
    add_reference :accounts, :user, index: true
    add_index     :accounts, :slug, unique: true
  end
end
