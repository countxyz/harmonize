class Event < ActiveRecord::Base
  validate :end_time_cannot_be_earlier_than_start_time
  validates_presence_of :title, :description, :start_time, :end_time

  private

    def end_time_cannot_be_earlier_than_start_time
      unless start_time.nil? || end_time.nil?
        time_error if end_time < start_time
      end
    end

    def time_error
      errors.add(:time_error, "can't be before start time")
    end
end
