class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  validates_presence_of :street_1, :city, :state, :postal_code, :country, :type

  validates_inclusion_of :type, in: %w( BillingAddress ShippingAddress )

  validates_length_of :street_2, maximum: 100, allow_blank: true
  validates_length_of :street_1, maximum: 100
  validates_length_of :city,     maximum: 50
  validates_length_of :country,  maximum: 30
  validates_length_of :type,        in: 14..15
  validates_length_of :state,       is: 2
  validates_length_of :postal_code, is: 5

  validates_format_of :state,       with: /\b[a-zA-Z]{2}\b/
  validates_format_of :postal_code, with: /\b\d{5}\b/

  def location
    "#{self.city}, #{self.state}"
  end
end
