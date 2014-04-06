class Assignment < ActiveRecord::Base
  STATUS_OPTIONS   = ['Not Started', 'In Progress', 'Completed']
  PRIORITY_OPTIONS = %w(Low High Urgent N/A)

  belongs_to :project

  validates_date :completed, on_or_after: :start_date, allow_blank: true

  validates :description, presence: true, length: { maximum: 100 }
  validates :status,      presence: true, inclusion: STATUS_OPTIONS
  validates :priority,    presence: true, inclusion: PRIORITY_OPTIONS
  validates :notes, length: { maximum: 1000 }
end
