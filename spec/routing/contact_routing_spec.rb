require 'rails_helper'

describe 'routing to contacts', type: :routing do
  it 'has a slug that is contact name' do
    expect(get: '/contacts/vandalay').to route_to(
      controller: 'contacts',
      action:     'show',
      id:         'vandalay')
  end
end
