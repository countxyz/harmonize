class Project < ActiveRecord::Base
	before_save { self.name = name.downcase }
	
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :status, presence: true
end
