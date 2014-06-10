require 'rails_helper'

describe 'routing to projects', type: :routing do
  it 'has a slug that is project name' do
    expect(get: '/projects/vandalay').to route_to(
      controller: 'projects',
      action:     'show',
      id:         'vandalay')
  end
end
