class Email < ActiveRecord::Base
  belongs_to :emailable, polymorphic: true

  validates_length_of :address, in: 5..50, allow_blank: true

  validates_format_of :address, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                                allow_blank: true
end
