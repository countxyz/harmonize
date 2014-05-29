class Phone < ActiveRecord::Base
  belongs_to :phoneable, polymorphic: true

  validates_length_of :mobile, :office, :home, :fax, :toll, is: 10,
                      allow_blank: true

  validates_numericality_of :mobile, :office, :home, :fax, :toll,
                            only_integer: true
end
