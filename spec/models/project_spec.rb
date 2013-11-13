require 'spec_helper'

describe Project do

	before(:each) do
		@project = Project.new(name: 'a', status: 'Completed', priority: 'N/A')
	end

	describe "a project with all fields" do

		it "is completely filled when all fields are provided" do
			@project.start_date 			= "2013-11-01"
			@project.target_date 			= "2013-11-02"
			@project.deadline 				= "2013-11-03"
			@project.completion_date 	= "2013-11-04"
			expect(@project).to be_valid
		end
	end

	describe "#name" do
		it "is invalid when not provided" do
			@project.name = nil
			expect(@project).to_not be_valid
		end

		it "is invalid when it has more than 50 characters" do
			@project.name = 'a' * 51
			expect(@project).to_not be_valid
		end

		it "is invalid when already taken" do
			project_with_same_name = @project.dup
			project_with_same_name.name = @project.name.upcase
			project_with_same_name.save
			expect(@project).to_not be_valid
		end
	end

	describe "#status" do
		it "is invalid when not provided" do
			@project.status = nil
			expect(@project).to_not be_valid
		end

		it "is valid with 'Not Started', 'In Progress', 'Completed'" do
			valid_statuses = ['Not Started', 'In Progress', 'Completed']
			valid_statuses.each do |valid_status|
				@project.status = valid_status
				expect(@project).to be_valid
			end
		end
	end

	describe "#priority" do
		it "is invalid when not provided" do
			@project.priority = nil
			expect(@project).to_not be_valid
		end

		it "is valid with 'N/A', 'Low', 'High', 'Urgent'" do
			valid_priorities = %w[Low High Urgent N/A]
			valid_priorities.each do |valid_priority|
				@project.priority = valid_priority
				expect(@project).to be_valid
			end
		end
	end

	describe "#notes" do
		it "is invalid when it has more than 1000 characters" do
			@project.notes = 'a' * 1001
			expect(@project).to_not be_valid
		end
	end

	describe "#target_date" do
		it "cannot be a date before start date" do
			@project.start_date 	= "2013-11-02"
			@project.target_date 	= "2013-11-01"
			expect(@project).to_not be_valid
		end
	end

	describe "#deadline" do
		it "cannot be a date before start date" do
			@project.start_date = "2013-11-02"
			@project.deadline 	= "2013-11-01"
			expect(@project).to_not be_valid
		end
	end
end