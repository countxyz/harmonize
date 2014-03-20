class Assignment < ActiveRecord::Base
  STATUS_OPTIONS = ['Not Started', 'In Progress', 'Completed']
  PRIORITY_OPTIONS = %w(Low High Urgent N/A)
  
  belongs_to :project

  validates :description, presence: true, length: { maximum: 100 }
  validates :status,      presence: true
  validates :priority,    presence: true
  validates :notes, length: { maximum: 1000 }
end
