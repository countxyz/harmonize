class Project < ActiveRecord::Base
	validates :name, presence: true
	validates :status, presence: true
end
