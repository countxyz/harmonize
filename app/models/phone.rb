class Phone < ActiveRecord::Base
  belongs_to :contact, inverse_of: :phone

  VALID_PHONE_REGEX = /\d{10}/

  validates :mobile, :office, :fax, :home, 
            presence: false, 
            allow_blank: true,
            uniqueness: { scope: :contact_id },
            format: { with: VALID_PHONE_REGEX }
end
