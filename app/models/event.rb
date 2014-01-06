class Event < ActiveRecord::Base
  
  validate :end_time_cannot_be_earlier_than_start_time

  validates_presence_of :title, :description, :start_time
  
  def end_time_cannot_be_earlier_than_start_time
    if start_time || end_time == nil
      errors.add(:end_time, "Times must be provided")
    else
      start_time >= end_time and !all_day
      errors.add(:end_time, "can't be before start_time")
    end
  end
end
