class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.timestamps null: false

      t.string :address, null: false
    end
    add_reference :emails, :emailable, index: true, polymorphic: true
  end
end
