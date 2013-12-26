class Event < ActiveRecord::Base
  
  validates_presence_of :title, :description
  validate :validate_timings
  
  def validate_timings
    if (starttime >= endtime) and !all_day
      errors[:base] << "Start Time must be before End Time"
    end
  end
end
