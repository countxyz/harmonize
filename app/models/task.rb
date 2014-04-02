class Task < ActiveRecord::Base

  validates :description, presence: true, length: { maximum: 50 }
  validates_datetime :completed, on_or_after: :start_date, allow_blank: true
end
