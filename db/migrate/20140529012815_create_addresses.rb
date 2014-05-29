class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.timestamps null: false

      t.string  :street_1,     null: false
      t.string  :street_2,     null: false, default: ''
      t.string  :city,         null: false
      t.string  :state,        null: false
      t.integer :postal_code,  null: false
      t.string  :country,      null: false
    end
  end
end
