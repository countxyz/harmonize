class Assignment < ActiveRecord::Base
  belongs_to :project

  validates :description, presence: true, length: { maximum: 100 }
  validates :status,      presence: true
  validates :priority,    presence: true
  validates :notes, length: { maximum: 1000 }
end
