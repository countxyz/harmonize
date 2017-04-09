class Task < ActiveRecord::Base
  include Nullable

  belongs_to :user

  validates_presence_of :description

  validates_length_of :description, maximum: 100

  scope :incomplete,  -> { includes(:user).where(completed: nil) }
  scope :complete,    -> { where.not(completed: nil) }
  scope :no_deadline, -> { where(deadline: nil) }

  def self.pending
    incomplete.order(deadline: :asc)
  end

  def self.completed_tasks
    complete.order(completed: :desc)
  end

  def self.overdue
    where('deadline IS NOT NULL AND deadline < ?', Time.zone.now.utc)
  end
end
