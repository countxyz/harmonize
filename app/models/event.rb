class Event < ActiveRecord::Base
  
  validates_presence_of :title, :description
  validate :validate_time
  
  def validate_time
    if (start_time >= end_time) and !all_day
      errors[:base] << "Start Time must be before End Time"
    end
  end
end
