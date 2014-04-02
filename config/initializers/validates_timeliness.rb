ValidatesTimeliness.setup do |config|
  config.use_plugin_parser = true
  config.extend_orms = [ :active_record ]

  # Shorthand date and time symbols for restrictions
  # config.restriction_shorthand_symbols.update(
  #   :now   => lambda { Time.current },
  #   :today => lambda { Date.current } )
  #
  # Add one or more formats making them valid.
  # e.g. add_formats(:date, 'd(st|rd|th) of mmm, yyyy')
  # config.parser.add_formats()
  #
  # Remove one or more formats making them invalid.
  # e.g. remove_formats(:date, 'dd/mm/yyy')
  # config.parser.remove_formats()
  #
  # Change the amiguous year threshold when parsing a 2 digit year
  # config.parser.ambiguous_year_threshold =  30
  #
  # Treat ambiguous dates, such as 01/02/1950, as a Non-US date.
  # config.parser.remove_us_formats
end
