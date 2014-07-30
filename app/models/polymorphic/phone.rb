class Phone < ActiveRecord::Base
  belongs_to :phoneable, polymorphic: true

  PHONE_FORMAT = /\A\d{9}/

  validates_length_of :mobile, :office, :home, :fax, :toll, is: 10,
                      allow_blank: true

  validates_format_of :mobile, :office, :home, :fax, :toll, with: PHONE_FORMAT
end
