class Task < ActiveRecord::Base

  validates :description, presence: true, length: { maximum: 50 }
  
  def no_deadline
    where("deadline is NULL")
  end
end
