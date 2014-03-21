class Assignment < ActiveRecord::Base
  STATUS_OPTIONS = ['Not Started', 'In Progress', 'Completed']
  PRIORITY_OPTIONS = %w(Low High Urgent N/A)

  belongs_to :project

  validate :target_date_cannot_be_earlier_than_start_date
  validate :deadline_cannot_be_earlier_than_start_date
  validate :cannot_be_completed_before_start_date

  validates :description, presence: true, length: { maximum: 100 }
  validates :status,      presence: true, inclusion: STATUS_OPTIONS
  validates :priority,    presence: true, inclusion: PRIORITY_OPTIONS
  validates :notes, length: { maximum: 1000 }

  private

    def target_date_cannot_be_earlier_than_start_date
      unless start_date.nil? || target_date.nil?
        date_error if target_date < start_date
      end
    end

    def deadline_cannot_be_earlier_than_start_date
      unless start_date.nil? || deadline.nil?
        date_error if deadline < start_date
      end
    end

    def cannot_be_completed_before_start_date
      unless start_date.nil? || completed.nil?
        date_error if completed < start_date
      end
    end

    def date_error
      errors.add(:date_error, "can't be before start date")
    end
end
