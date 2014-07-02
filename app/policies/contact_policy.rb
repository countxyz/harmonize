class ContactPolicy < ApplicationPolicy
  attr_reader :user, :contact

  def initialize(user, contact)
    @user, @contact = user, contact
  end
end
