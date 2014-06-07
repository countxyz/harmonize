class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  validates_presence_of :street_1, :city, :state, :postal_code, :country, :type

  validates_inclusion_of :type, in: %w( BillingAddress ShippingAddress )

  validates_length_of :street_2, maximum: 100, allow_blank: true
  validates_length_of :street_1, maximum: 100
  validates_length_of :city,     maximum: 50
  validates_length_of :country,  maximum: 30
  validates_length_of :type,     in: 14..15
  validates_length_of :state,    is: 2

  validates_numericality_of :postal_code, only_integer: true
end
