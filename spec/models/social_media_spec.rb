require 'spec_helper'

describe SocialMedia do

  describe 'associations' do
    it { should belong_to(:contact) }
  end
end
