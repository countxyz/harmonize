class Project < ActiveRecord::Base
  before_save { self.name = name.downcase }

  STATUS_OPTIONS = ['Not Started', 'In Progress', 'Completed']
  PRIORITY_OPTIONS = %w(Low High Urgent N/A)
  
  validates :name, 
            presence: true,
            length: { maximum: 50 },
            uniqueness: { case_sensitive: false }
  
  validates :status, 
            presence: true,
            inclusion: STATUS_OPTIONS

  validates :priority,
            presence: true,
            inclusion: PRIORITY_OPTIONS
end
