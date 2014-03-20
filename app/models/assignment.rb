class Assignment < ActiveRecord::Base
  STATUS_OPTIONS = ['Not Started', 'In Progress', 'Completed']
  PRIORITY_OPTIONS = %w(Low High Urgent N/A)

  belongs_to :project

  validate :target_date_cannot_be_earlier_than_start_date

  validates :description, presence: true, length: { maximum: 100 }
  validates :status,      presence: true, inclusion: STATUS_OPTIONS
  validates :priority,    presence: true, inclusion: PRIORITY_OPTIONS
  validates :notes, length: { maximum: 1000 }

  private

    def target_date_cannot_be_earlier_than_start_date
      unless start_date.nil? || target_date.nil?
        start_date_error if target_date < start_date
      end
    end

    def start_date_error
      errors.add(:target_date, "can't be before start date")
    end
end
