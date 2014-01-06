collection @events
attributes :id, :title, :description, :start_time, :end_time
node(:start)  { |event| event.start_time }
node(:end)    { |event| event.end_time }
node(:url)    { |event| event_url(event) }
