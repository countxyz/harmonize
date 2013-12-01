require 'spec_helper'

describe Phone do
  it "does not allow duplicate phone numbers per contact" do
    contact = create(:contact)
    create(:phone, contact: contact)
    expect(build(:phone, office: "917-555-5555")).to_not be_valid
  end

  it "allows two contacts to share a phone number" do
    contact = create(:contact)
    create(:phone, contact: contact)
    other_contact = create(:other_contact)
    expect(build(:phone, office: "917-555-5555", contact: other_contact)).to be_valid
  end
end
