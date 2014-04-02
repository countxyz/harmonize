ValidatesTimeliness.setup do |config|
  config.use_plugin_parser = true
  config.extend_orms = [ :active_record ]
end
