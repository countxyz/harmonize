class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :website
      t.string :email
      t.string :phone
      t.string :fax
      t.text   :notes

      t.timestamps
    end
  end
end
