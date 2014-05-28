require 'spec_helper'

describe 'routing to contacts' do
  it 'has a slug that is contact name' do
    expect(get: '/contacts/vandalay').to route_to(
      controller: 'contacts',
      action:     'show',
      id:         'vandalay')
  end
end
