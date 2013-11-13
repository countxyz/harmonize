class Project < ActiveRecord::Base
  validate :deadline_cannot_be_earlier_than_start_date
  validate :target_date_cannot_be_earlier_than_start_date

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

  validates :notes,
            length: { maximum: 1000 }

  def deadline_cannot_be_earlier_than_start_date
    if deadline.present? && deadline < start_date
      errors.add(:deadline, "can't be before start date")
    end
  end

  def target_date_cannot_be_earlier_than_start_date
    if target_date.present? && target_date < start_date
      errors.add(:target_date, "can't be before start date")
    end
  end
end
