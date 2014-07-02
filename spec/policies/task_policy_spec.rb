require 'rails_helper'

describe TaskPolicy do
  subject { TaskPolicy }

  permissions :create? do
    it 'denies access if user is not admin' do
      expect(subject).not_to permit(create(:user))
    end

    it 'grants access to admins' do
      expect(subject).to permit(create(:admin))
    end
  end

  permissions :update? do
    it 'denies access if user is not admin' do
      expect(subject).not_to permit(create(:user))
    end

    it 'grants access to admins' do
      expect(subject).to permit(create(:admin))
    end
  end

  permissions :destroy? do
    it 'denies access if user is not admin' do
      expect(subject).not_to permit(create(:user))
    end

    it 'grants access to admins' do
      expect(subject).to permit(create(:admin))
    end
  end
end
