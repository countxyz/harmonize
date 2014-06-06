class CreateSocialMedia < ActiveRecord::Migration
  def change
    create_table :social_media do |t|
      t.timestamps null: false

      t.string :google_plus, null: false, default: ''
      t.string :github,      null: false, default: ''
      t.string :twitter,     null: false, default: ''
      t.string :skype,       null: false, default: ''
      t.string :coderwall,   null: false, default: ''
      t.string :linkedin,    null: false, default: ''
      t.string :facebook,    null: false, default: ''
    end
    add_reference :social_media, :sociable, null: false, polymorphic: true,
                                                         index:       true
  end
end
