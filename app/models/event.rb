class Event < ActiveRecord::Base

  validates_presence_of :title, :description, :start_time, :end_time, :all_day
  
end
