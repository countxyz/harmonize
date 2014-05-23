require 'spec_helper'

describe Contact do
  it "returns a contact's full name as a string" do
    contact = build_stubbed(:contact, first_name: 'John', last_name: 'Doe')
    expect(contact.name).to eq 'John Doe'
  end

  it 'is invalid with a duplicate email' do
    invalid_contact = build_stubbed(:contact, email: 'firstemail@firstemail.com',
                                    secondary_email: 'firstemail@firstemail.com')
    expect(invalid_contact).to_not be_valid
  end

  describe 'presence' do
    it { should validate_presence_of(:first_name) }
  end

  describe 'field lengths' do
    it { should ensure_length_of(:first_name).is_at_most(30)      }
    it { should ensure_length_of(:last_name).is_at_most(30)       }
    it { should ensure_length_of(:company).is_at_most(50)         }
    it { should ensure_length_of(:email).is_at_most(50)           }
    it { should ensure_length_of(:secondary_email).is_at_most(50) }
    it { should ensure_length_of(:notes).is_at_most(600)          }
  end

  describe 'format' do
    it 'is valid with correct email format' do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        expect(build(:contact, email: valid_address)).to be_valid
      end
    end
  end
end
