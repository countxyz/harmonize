require 'spec_helper'

describe Project do

	before do
		@project = Project.new(name: "a")
	end

	subject { @project }

	expect(@project).to be_valid
end
