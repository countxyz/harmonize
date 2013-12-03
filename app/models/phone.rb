class Phone < ActiveRecord::Base
  belongs_to :contact, inverse_of: :phone

  validates :mobile, :office, :fax, :home, presence: false, allow_blank: true,
            uniqueness: { scope: :contact_id }
end
