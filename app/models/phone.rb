class Phone < ActiveRecord::Base
  VALID_PHONE_REGEX = /\d{10}/

  belongs_to :contact, inverse_of: :phone

  validates :office, :mobile, :fax, :home, 
            uniqueness: { scope: :contact_id },
            format: { with: VALID_PHONE_REGEX }
end
