require 'spec_helper'

describe Account do

  describe 'associations' do
    it { should have_one(:phone)                                }
    it { should have_one(:social_media)                         }
    it { should have_one(:billing_address)                      }
    it { should have_one(:shipping_address)                     }
    it { should accept_nested_attributes_for(:phone)            }
    it { should accept_nested_attributes_for(:social_media)     }
    it { should accept_nested_attributes_for(:billing_address)  }
    it { should accept_nested_attributes_for(:shipping_address) }
  end

  describe 'presence' do
    it { should validate_presence_of(:name) }
  end

  describe 'field lengths' do
    it { should ensure_length_of(:name).is_at_most(50)                   }
    it { should ensure_length_of(:website).is_at_least(6).is_at_most(50) }
    it { should ensure_length_of(:email).is_at_least(5).is_at_most(50)   }
    it { should ensure_length_of(:notes).is_at_most(1000)                }
  end

  describe 'format' do
    it { should allow_value('abc@xyz.com').for(:email) }
  end
end
