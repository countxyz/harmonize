require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv'

Bundler.require(*Rails.groups)

module Harmonize
  class Application < Rails::Application
    config.autoload_paths += Dir[

      "#{Rails.root}/app/models/concerns",
      "#{Rails.root}/app/models/nulls",
      "#{Rails.root}/app/models/polymorphic",
      "#{Rails.root}/app/models/sti",
      "#{Rails.root}/app/pdfs"]

    config.assets.initialize_on_precompile = false
    
    config.opal.method_missing      = true
    config.opal.optimized_operators = true
    config.opal_const_missing       = true
    config.opal.arity_check         = false

    config.time_zone = 'Eastern Time (US & Canada)'
  end
end
