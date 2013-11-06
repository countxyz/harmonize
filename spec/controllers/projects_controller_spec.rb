require 'spec_helper'

describe ProjectsController do

	describe "GET #index" do
		it "has a 200 status code" do
			get :index
			expect(response.status).to eq(200)
		end

		it "renders the :index template" do
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

	describe "GET #show" do
		before(:each) do
			@project = Project.create(id: 1, name: '1',
															  status: 'Completed', priority: 'N/A')
		end

		it "renders the :show template" do
			get :show, id: 1
			expect(response).to render_template("show")
		end

		it "assigns the requested project to @project" do
			get :show, id: @project
			expect(assigns(:project)).to eq(@project)
		end
	end

	describe "GET #new" do
		let(:project) { Project.create(name: '1', status: 'Completed',
																	 priority: 'N/A') }

		it "renders the :new template" do
			get :new
			expect(response).to render_template("new")
		end

    it "assigns a new Project to @project" do
    	get :new
      expect(assigns(:project)).to be_a_new(Project)
    end
	end
end
