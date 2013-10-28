class Project < ActiveRecord::Base
	before_save { self.name = name.downcase }
	
	validates :name, 
						presence: true,
						length: { maximum: 50 },
						uniqueness: { case_sensitive: false }
	
	validates :status, 
						presence: true,
						inclusion: %w(Not\ Started In\ Progress Completed)

	validates :priority,
						inclusion: %w(Low High Urgent N/A)
end
