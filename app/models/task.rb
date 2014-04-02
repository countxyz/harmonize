class Task < ActiveRecord::Base

  validates :description, presence: true
end
