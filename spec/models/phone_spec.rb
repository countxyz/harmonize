require 'spec_helper'

describe Phone do
  it "does not allow duplicate phone numbers per contact" do
    contact = create(:contact)
    create(:phone, contact: contact)
    expect(build(:phone, office: "9175555555")).to_not be_valid
  end

  it "allows two contacts to share a phone number" do
    contact = create(:contact)
    create(:phone, contact: contact)
    other_contact = create(:other_contact)
    expect(build(:phone, office: "9175555555", contact: other_contact)).to be_valid
  end

  describe "format" do
    it "is invalid without 10 numbers" do
      contact = create(:contact)
      create(:phone, contact: contact)
      expect(build(:phone, office: "91755555555")).to_not be_valid
    end
  end
end
