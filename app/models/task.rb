class Task < ActiveRecord::Base
  validates :description, presence: true, length: { maximum: 50 }
  
  def self.no_deadline
    where 'deadline is NULL'
  end

  def self.pending
    where 'completed is NULL'
  end

  def self.completed_task
    where.not 'completed is NULL'
  end

  def self.overdue
    where 'deadline IS NOT NULL AND deadline < ?', Time.now
  end
end
