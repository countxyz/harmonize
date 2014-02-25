class Project < ActiveRecord::Base
  STATUS_OPTIONS = ['Not Started', 'In Progress', 'Completed']
  PRIORITY_OPTIONS = %w(Low High Urgent N/A)
  IMAGE_TYPES = %w(image/jpeg image/jpg image/png)

  has_attached_file :image, styles: { small: '100x100', medium: '200x200',
                                      large: '300x300' }

  validate :deadline_cannot_be_earlier_than_start_date
  validate :target_date_cannot_be_earlier_than_start_date
  validate :completion_date_cannot_be_earlier_than_start_date
  
  validates :name, presence: true, length: { maximum: 50 }

  validates :role, presence: true, length: { maximum: 100 }

  validates :website, length: { maximum: 100 }

  validates_attachment_content_type :image, content_type: IMAGE_TYPES
  
  validates :status, presence: true, inclusion: STATUS_OPTIONS

  validates :priority, presence: true, inclusion: PRIORITY_OPTIONS

  validates :notes, length: { maximum: 1000 }

  def target_date_cannot_be_earlier_than_start_date
    unless start_date.nil? || target_date.nil?
      start_date_error if target_date < start_date
    end
  end

  def deadline_cannot_be_earlier_than_start_date
    unless start_date.nil? || deadline.nil?
      start_date_error if deadline < start_date
    end
  end

  def completion_date_cannot_be_earlier_than_start_date
    unless start_date.nil? || completion_date.nil?
      start_date_error if completion_date < start_date
    end
  end

  private

    def start_date_error
      errors.add(:target_date, "can't be before start date")
    end
end
