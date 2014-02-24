class Project < ActiveRecord::Base
  STATUS_OPTIONS = ['Not Started', 'In Progress', 'Completed']
  PRIORITY_OPTIONS = %w(Low High Urgent N/A)

  validate :deadline_cannot_be_earlier_than_start_date
  validate :target_date_cannot_be_earlier_than_start_date
  validate :completion_date_cannot_be_earlier_than_start_date
  
  validates :name, length: { maximum: 50 }, presence: true

  validates :role, length: { maximum: 100 }, presence: true
  
  validates :status, inclusion: STATUS_OPTIONS, presence: true

  validates :priority, inclusion: PRIORITY_OPTIONS, presence: true

  validates :notes, length: { maximum: 1000 }

  def start_date
    self[:start_date] || "N/A"
  end

  def target_date
    self[:target_date] || "N/A"
  end

  def deadline
    self[:deadline] || "N/A"
  end

  def table_date_format(date)
    if date != "N/A"
      date.strftime("%m/%d/%Y")
    else
      date
    end
  end

  def profile_date_format(date)
    if date != "N/A"
      date.strftime("%B %d, %Y")
    else
      date
    end
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
