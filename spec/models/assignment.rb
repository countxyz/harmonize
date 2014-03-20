require 'spec_helper'

describe Assignment do
  let(:project) { FactoryGirl.create :project }

  describe 'empty fields' do
    it 'is invalid without a description' do
      expect(build(:assignment, description: nil)).to_not be_valid
    end
  end
end
