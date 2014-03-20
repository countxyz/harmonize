class Assignment < ActiveRecord::Base
  belongs_to :project

  validates :description, presence: true, length: { maximum: 100 }
  validates :status,      presence: true
  validates :priority,    presence: true
end
