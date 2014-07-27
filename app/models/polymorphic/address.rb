class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  ZIP_FORMAT   = /\A\d{5}(?:[-\s]\d{4})?\z/
  STATE_FORMAT = /\A[a-zA-Z]{2}$\z/

  validates_presence_of :street_1, :city, :state, :postal_code, :country, :type

  validates_inclusion_of :type, in: %w( BillingAddress ShippingAddress )

  validates_length_of :street_2, maximum: 100, allow_blank: true
  validates_length_of :street_1, maximum: 100
  validates_length_of :city,     maximum: 50
  validates_length_of :country,  maximum: 30
  validates_length_of :type,        in: 14..15
  validates_length_of :postal_code, in: 5..10
  validates_length_of :state,       is: 2

  validates_format_of :state,       with: STATE_FORMAT
  validates_format_of :postal_code, with: ZIP_FORMAT

  def location
    "#{self.city}, #{self.state}"
  end
end
