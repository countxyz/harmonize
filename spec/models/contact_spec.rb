require 'spec_helper'

describe Contact do

  before(:each) do 
    @contact = Contact.new(first_name: "a", last_name: "a", 
                           email: "contact@target.com")
  end

  it "is valid with a first name, last name, email, and phone number" do
    contact = Contact.new(
      first_name:   'Bill',
      last_name:    'Burr',
      email:        'bill@billburr.com')
    expect(contact).to be_valid
  end

  describe "#first_name" do
    it "is invalid when not provided" do
      expect(Contact.new(first_name: nil)).to have(1).errors_on(:first_name)
    end

    it "is invalid when it has more than 30 characters" do
      @contact.first_name = 'a' * 31
      expect(@contact).to_not be_valid
    end   
  end

  describe "#last_name" do
    it "is invalid when not provided" do
      expect(Contact.new(last_name: nil)).to have(1).errors_on(:last_name)
    end

    it "is invalid when it has more than 30 characters" do
      @contact.last_name = 'a' * 31
      expect(@contact).to_not be_valid
    end
  end

  it "is invalid without an email address" do
    expect(Contact.new(email: nil)).to_not be_valid
  end

  describe "#email" do
    it "is valid with the format" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp
                     a+b@baz.cn]
      addresses.each do |valid_address|
        @contact.email = valid_address
        expect(@contact).to be_valid
      end
    end
    
    it "is invalid with the format" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @contact.email = invalid_address
        expect(@contact).not_to be_valid
      end
    end
  end
end
