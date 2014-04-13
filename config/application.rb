require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

Bundler.require(:default, Rails.env)

module Harmonize
  class Application < Rails::Application
    config.assets.initialize_on_precompile = false
    config.time_zone = 'Eastern Time (US & Canada)'
    config.opal.method_missing             = true
    config.opal.optimized_operators        = true
    config.opal.arity_check                = false
    config.opal_const_missing              = true

    config.generators do |g|
      g.test_framework :rspec,
        fixtures:         true,
        view_specs:       false,
        helper_specs:     false,
        routing_specs:    false,
        controller_specs: false,
        request_specs:    false,
        feature_specs:    true,
        model_specs:      true
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end
  end
end
