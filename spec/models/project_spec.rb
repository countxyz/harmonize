require 'spec_helper'

describe Project do
	
	it "is valid with a name, status, priority, start_date,
		target_date, deadline, completion_date, and notes" do
		project = Project.new(
			name: 						'a',
			status: 					'a',
			priority: 				'a',
			start_date: 			'0000-00-00',
			target_date: 			'0000-00-00',
			deadline: 				'0000-00-00',
			completion_date: 	'0000-00-00',
			notes: 						'a')
		expect(project).to be_valid
	end

	it "is invalid without a name" do
		expect(Project.new(name: nil)).to have(1).errors_on(:name)
	end

	it "is invalid without a status" do
		expect(Project.new(status: nil)).to have(1).errors_on(:status)
	end
end
