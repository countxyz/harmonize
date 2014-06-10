require 'rails_helper'

describe 'routing to admin users', type: :routing do
  it 'has a slug that is users name' do
    expect(get: '/admin/users/vandalay').to route_to(
      controller: 'admin/users',
      action:     'show',
      id:         'vandalay')
  end
end
