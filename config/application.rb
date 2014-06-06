require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'
require 'csv'

Bundler.require(:default, Rails.env)

module Harmonize
  class Application < Rails::Application
    config.assets.initialize_on_precompile = false
    config.time_zone = 'Eastern Time (US & Canada)'
    config.autoload_paths << "#{Rails.root}/app/pdfs"
    config.opal.method_missing             = true
    config.opal.optimized_operators        = true
    config.opal.arity_check                = false
    config.opal_const_missing              = true
  end
end
