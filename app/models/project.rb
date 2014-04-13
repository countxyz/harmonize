class Project < ActiveRecord::Base
  belongs_to :user
  has_many   :assignments, dependent: :destroy

  IMAGE_TYPES = %w(image/jpeg image/jpg image/png)

  has_attached_file :image, styles: { small: '100x100', large: '300x300' }
  validates_attachment_content_type :image, content_type: IMAGE_TYPES
  
  validates :name, uniqueness: true, presence: true, length: { maximum: 50 }
  
  validates :employer, length: { maximum: 50 }

  validates :website, allow_blank: true, length: { in: 4..100 }
  validates :github,  allow_blank: true, length: { in: 12..100 }
  
  validates :notes, length: { maximum: 1000 }

  def self.list_by_recent
    order('created_at desc')
  end

  def assignment_total_for_project
    assignments.distinct.count(:project_id)
  end

  def assignments_completed_for_project
    assignments.where("status = 'completed'").count
  end
end
