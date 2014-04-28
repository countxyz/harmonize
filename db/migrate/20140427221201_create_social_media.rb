class CreateSocialMedia < ActiveRecord::Migration
  def change
    create_table :social_media do |t|
      t.string :skype
      t.string :google_plus
      t.string :github
      t.string :linkedin
      t.string :twitter
      t.string :facebook
      t.string :coderwall

      t.timestamps
    end
  end
end
