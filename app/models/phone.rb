class Phone < ActiveRecord::Base
  belongs_to :contact, inverse_of: :phone 

  validates :office, :mobile, :fax, :home, numericality: { only_integer: true },
            length: { is: 10 }, uniqueness: { scope: :contact }
end
