class Phone < ActiveRecord::Base
  belongs_to :contact

  validates :mobile, :office, :fax, :home, presence: false, allow_blank: true,
            uniqueness: { scope: :contact_id }
end
