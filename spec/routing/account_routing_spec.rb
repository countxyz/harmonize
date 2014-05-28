require 'spec_helper'

describe 'routing to accounts' do
  it 'has a slug that is account name' do
    expect(get: '/accounts/vandalay').to route_to(
      controller: 'accounts',
      action:     'show',
      id:         'vandalay')
  end
end
