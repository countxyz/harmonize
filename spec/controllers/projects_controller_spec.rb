require 'spec_helper'

describe ProjectsController do

	describe "GET #index" do
		it "has a 200 status code" do
			get :index
			expect(response.status).to eq(200)
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end

		it "loads all projects into @projects" do
			project_1 = Project.create(name: '1', status: 'Completed', priority: 'N/A')
			project_2 = Project.create(name: '2', status: 'Completed', priority: 'N/A')
			get :index
			expect(assigns(:projects)).to match_array([project_1, project_2])
		end
	end
end
