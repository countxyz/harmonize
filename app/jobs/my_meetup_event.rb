require 'net/http'
require 'json'

def meetup_dashboard
  "https://api.meetup.com/dashboard.json?"
end

def api_key
  API_KEY = ENV['MEETUP_API_KEY']
end

def uri_builder
  meetup_dashboard + api_key
end

def request
  request = Net::HTTP::Get.new(uri_builder)
end

def response
  response = http.request(request)
end

def use_meetup_api
  Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    request
    response
    response.body
  end
end 

Dashing.scheduler.every '1h', first_in: 1.second.since do |job|
  json_response = use_meetup_api
  Dashing.send_event('my_meetup_events', { current: json_response} )
end
