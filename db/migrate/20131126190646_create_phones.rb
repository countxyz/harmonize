class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :contact_id, index: true
      t.string :mobile
      t.string :office
      t.string :voip
      t.string :fax
      t.string :home

      t.timestamps
    end
  end
end
