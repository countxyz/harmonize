class AddContactRefToSocialMedia < ActiveRecord::Migration
  def change
    add_reference :social_media, :contact, index: true
  end
end
