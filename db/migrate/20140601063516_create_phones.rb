class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.timestamps null: false

      t.string  :mobile,         null: false, default: ''
      t.string  :office,         null: false, default: ''
      t.string  :fax,            null: false, default: ''
      t.string  :home,           null: false, default: ''
      t.string  :toll,           null: false, default: ''
    end
    add_reference :phones, :phoneable, null: false, polymorphic: true, index: true
  end
end
