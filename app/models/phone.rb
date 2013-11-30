class Phone < ActiveRecord::Base
  belongs_to :contact

  validates :mobile, :office, :fax, :home, presence: false, uniqueness: true
end
