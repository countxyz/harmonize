require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv'

Bundler.require(:default, Rails.env)

module Harmonize
  class Application < Rails::Application

    config.autoload_paths << "#{Rails.root}/app/pdfs"
    config.autoload_paths << "#{Rails.root}/app/models/nulls"
    config.autoload_paths << "#{Rails.root}/app/models/polymorphic"
    config.autoload_paths << "#{Rails.root}/app/models/sti"

    config.assets.initialize_on_precompile = false
    
    config.opal.method_missing      = true
    config.opal.optimized_operators = true
    config.opal_const_missing       = true
    config.opal.arity_check         = false

    config.time_zone = 'Eastern Time (US & Canada)'
  end
end
