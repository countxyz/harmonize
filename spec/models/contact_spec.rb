require 'spec_helper'

describe Contact do
  it "is valid with a first name, last name, email, and phone number" do
    contact = Contact.new(
      first_name:   'Bill',
      last_name:    'Burr',
      email:        'bill@billburr.com',
      phone: '(555) 555 - 5555')
    expect(contact).to be_valid
  end

  it "is invalid without a first name"
  it "is invalid without a last name"
  it "is invalid without an email address"
end
