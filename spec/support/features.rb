RSpec.configure do |config|
  config.include Features::CapybaraHelpers,      type: :feature
  config.include Features::AuthorizationHelpers, type: :feature
  config.include Features::SessionHelpers,       type: :feature
  config.include Features::JavascriptHelpers,    type: :feature
end
