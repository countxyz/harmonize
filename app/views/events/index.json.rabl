collection @events
attributes :title, :description, :start_time, :end_time
node(:start)  { |event| event.start_time }
node(:end)    { |event| event.end_time }