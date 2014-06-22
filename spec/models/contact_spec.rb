require 'rails_helper'

describe Contact do
  it "returns a contact's full name as a string" do
    contact = build_stubbed(:contact, first_name: 'John', last_name: 'Doe')
    expect(contact.name).to eq 'John Doe'
  end

  describe 'associations' do
    it { should belong_to(:user)                            }
    it { should have_one(:phone)                            }
    it { should have_one(:social_media)                     }
    it { should have_many(:emails)                          }
    it { should accept_nested_attributes_for(:emails)       }
    it { should accept_nested_attributes_for(:phone)        }
    it { should accept_nested_attributes_for(:social_media) }
  end

  describe 'presence' do
    it { should validate_presence_of(:first_name) }
  end

  describe 'field lengths' do
    it { should ensure_length_of(:first_name).is_at_most(30) }
    it { should ensure_length_of(:last_name).is_at_most(30)  }
    it { should ensure_length_of(:company).is_at_most(50)    }
    it { should ensure_length_of(:notes).is_at_most(600)     }
  end
end
