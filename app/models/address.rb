class Address < ActiveRecord::Base
  validates_presence_of :street_1, :city, :state, :postal_code, :country

  validates_length_of :street_1, maximum: 100
  validates_length_of :street_2, maximum: 100
  validates_length_of :city,     maximum: 50

  validates_numericality_of :postal_code, only_integer: true
end
