require 'spec_helper'

describe Contact do
  it "is valid with a first name, last name, email, and phone number" do
    contact = Contact.new(
      first_name:   'Bill',
      last_name:    'Burr',
      email:        'bill@billburr.com')
    expect(contact).to be_valid
  end

  it "is invalid without a first name" do
    expect(Contact.new(first_name: nil)).to have(1).errors_on(:first_name)
  end
  
  it "is invalid without a last name"
  it "is invalid without an email address"
end
