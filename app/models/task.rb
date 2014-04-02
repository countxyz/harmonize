class Task < ActiveRecord::Base

  validates :description, presence: true, length: { maximum: 50 }
end
