require 'spec_helper'

describe Phone do
  it "does not allow duplicate phone numbers per contact" do
    contact = create(:contact)
    create(:phone, contact: contact)
    expect(build(:phone, office: "917-555-5555")).to_not be_valid
  end

  it "allows two contacts to share a phone number"

end
