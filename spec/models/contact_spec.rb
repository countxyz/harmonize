require 'rails_helper'

describe Contact do

  describe 'associations' do
    it { should belong_to(:user)                            }
    it { should have_one(:phone).dependent(:destroy)        }
    it { should have_one(:social_media).dependent(:destroy) }
    it { should have_many(:emails).dependent(:destroy)      }
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

  describe 'contact name' do
    it 'first and last name joined as string' do
      expect(build(:contact, first_name: 'a', last_name: 'b').contact_name).to eq 'a b'
    end
  end

  describe 'default list order' do
    let(:contact) { create(:contact) }
    let(:older_contact) { create(:contact, created_at: 3.days.ago) }

    it { expect(Contact.recent_first).to eq [contact, older_contact] }
  end
end
