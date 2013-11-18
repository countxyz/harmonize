class Project < ActiveRecord::Base
  STATUS_OPTIONS = ['Not Started', 'In Progress', 'Completed']
  PRIORITY_OPTIONS = %w(Low High Urgent N/A)

  validate :deadline_cannot_be_earlier_than_start_date
  validate :target_date_cannot_be_earlier_than_start_date
  validate :completion_date_cannot_be_earlier_than_start_date

  validates :name, :role, :status, :priority, :start_date, :target_date,
            :deadline, :completion_date, presence: true
  
  validates :name, 
            length: { maximum: 50 }

  validates :role, 
            length: { maximum: 100 }
  
  validates :status, 
            inclusion: STATUS_OPTIONS

  validates :priority,
            inclusion: PRIORITY_OPTIONS

  validates :notes,
            length: { maximum: 1000 }

  def start_date
    self[:start_date] || "N/A"
  end

  def target_date
    self[:target_date] || "N/A"
  end

  def deadline
    self[:deadline] || "N/A"
  end

  def completion_date
    self[:completion_date] || "N/A"
  end  

  def target_date_cannot_be_earlier_than_start_date
    unless start_date == "N/A" || target_date == "N/A"
      if target_date < start_date
        errors.add(:target_date, "can't be before start date")
      end
    end
  end

  def deadline_cannot_be_earlier_than_start_date
    unless start_date == "N/A" || deadline == "N/A"
      if deadline < start_date
        errors.add(:deadline, "can't be before start date")
      end
    end
  end

  def completion_date_cannot_be_earlier_than_start_date
    unless start_date == "N/A" || completion_date == "N/A"
      if completion_date < start_date
        errors.add(:completion_date, "can't be before start date")
      end
    end
  end
end