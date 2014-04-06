class Task < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user
  validates :description, presence: true, length: { maximum: 50 }
  
  def self.no_deadline
    where('deadline is NULL')
  end
end
