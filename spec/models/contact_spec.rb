require 'spec_helper'

describe Contact do
  it "has a valid factory" do
    expect(build(:contact)).to be_valid
  end

  describe "empty fields" do
    it "is invalid without a first name" do
      expect(build(:contact, first_name: nil)).to_not be_valid
    end

    it "is invalid without a last name" do
      expect(build(:contact, last_name: nil)).to_not be_valid
    end

    it "is invalid without an email address" do
      expect(build(:contact, email: nil)).to_not be_valid
    end

    it "is valid without a phone" do
      expect(build(:contact, phone: nil)).to be_valid
    end
  end

  describe "field lengths" do
    it "is invalid when first name has more than 30 characters" do
      expect(build(:contact, first_name: 'a' * 31)).to_not be_valid
    end

    it "is invalid when last name has more than 30 characters" do
      expect(build(:contact, last_name: 'a' * 31)).to_not be_valid
    end

    it "is invalid when email has more than 50 characters" do
      expect(build(:contact, email: 'a' * 45 + "@a.com")).to_not be_valid
    end
  end

  describe "format" do

    it "is invalid with an incorrect email format" do
      addresses = %w[a@foo,com a_at_foo.org a.b@foo. a@b_baz.com foo@b+baz.com]
      addresses.each do |invalid_address|
        expect(build(:contact, email: invalid_address)).to_not be_valid
      end
    end

    it "is valid with a correct email format" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        expect(build(:contact, email: valid_address)).to be_valid
      end
    end
  end
end
