class Task < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :description

  validates_length_of :description, maximum: 100

  def self.pending
    where('completed is NULL').order(deadline: :asc)
  end

  def self.completed_task
    where.not('completed is NULL').order(completed: :desc)
  end

  def self.overdue
    where('deadline IS NOT NULL AND deadline < ?', Time.zone.now.utc)
  end
  
  def self.no_deadline
    where('deadline is NULL')
  end
end
