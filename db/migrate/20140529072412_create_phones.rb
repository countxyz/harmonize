class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.timestamps

      t.string  :mobile,         null: false, default: ''
      t.string  :office,         null: false, default: ''
      t.string  :fax,            null: false, default: ''
      t.string  :home,           null: false, default: ''
      t.string  :toll,           null: false, default: ''
      t.integer :phoneable_id,   null: false
      t.string  :phoneable_type, null: false
    end
  end
end
