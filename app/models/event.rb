class Event < ActiveRecord::Base

  belongs_to :user

  validate :finish_cannot_be_earlier_than_start
  
  validates_presence_of :name, :description, :start, :finish

  validates_length_of :name,        in: 2..100
  validates_length_of :description, in: 2..1000

  private

    def finish_cannot_be_earlier_than_start
      unless start.nil? || finish.nil?
        time_error if finish < start
      end
    end

    def time_error
      errors.add(:time_error, 'The fundamental laws of nature prevent time travel')
    end
end
