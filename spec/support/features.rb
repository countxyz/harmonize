RSpec.configure do |config|
  config.include Features::SessionHelpers,    type: :feature
  config.include Features::JavascriptHelpers, type: :feature
end
