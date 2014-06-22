require 'rails_helper'

describe Email do

  describe 'field lengths' do
    it { should ensure_length_of(:address).is_at_least(5).is_at_most(50) }
  end

  describe 'format' do
    it { should allow_value('abc@xyz.com').for(:address) }
  end
end
