require 'spec_helper'

describe Project do

	it "has a valid factory" do
		expect(build(:project)).to be_valid
	end

	it "is completely filled when all fields are provided" do
		expect(build(:project_all_fields)).to be_valid
	end

	describe "empty fields" do
		it "is invalid when name is not provided" do
			expect(build(:project, name: nil)).to_not be_valid
		end

		it "is invalid when status is not provided" do
			expect(build(:project, status: nil)).to_not be_valid
		end

		it "is invalid when priority is not provided" do
			expect(build(:project, priority: nil)).to_not be_valid
		end

		it "is valid for dates and returns 'N/A' when not provided" do
			project = create(:project)
			expect(project.start_date).to eq "N/A"
			expect(project.target_date).to eq "N/A"
			expect(project.deadline).to eq "N/A"
			expect(project.completion_date).to eq "N/A"
		end
	end

	describe "field lengths" do
    it "is invalid when name has more than 50 characters" do
      expect(build(:project, name: 'a' * 51)).to_not be_valid
    end

    it "is invalid when role has more than 100 characters" do
      expect(build(:project, role: 'a' * 101)).to_not be_valid
    end

    it "is invalid when notes has more than 1000 characters" do
      expect(build(:project, notes: 'a' * 1001)).to_not be_valid
    end
	end

	describe "valid entries" do
		it "is valid when status is 'Not Started', 'In Progress', 'Completed'" do
			valid_statuses = ['Not Started', 'In Progress', 'Completed']
			valid_statuses.each do |valid_status|
				expect(build(:project, status: valid_status)).to be_valid
			end
		end

		it "is valid when priority is 'N/A', 'Low', 'High', 'Urgent'" do
			valid_priorities = %w[Low High Urgent N/A]
			valid_priorities.each do |valid_priority|
				expect(build(:project, priority: valid_priority)).to be_valid
			end
		end
	end

	describe "invalid dates" do
		it "cannot have a target date before start date" do
			project = build(:project, start_date: "11/02/2013", target_date: "11/01/2013")
			expect(project).to_not be_valid
		end

		it "cannot have a deadline before start date" do
			project = build(:project, start_date: "11/02/2013", deadline: "11/01/2013")
			expect(project).to_not be_valid
	end

		it "cannot be a date before start date" do
			project = build(:project, start_date: "11/02/2013", completion_date: "11/01/2013")
			expect(project).to_not be_valid
		end
	end
end
