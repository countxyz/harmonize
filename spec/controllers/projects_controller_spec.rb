require 'spec_helper'

describe ProjectsController do
	let(:project) { Project.create(name: '1', status: 'Completed', priority: 'N/A') }

	describe "GET#index" do
		before :each do
			get :index
		end

		it "has a 200 status code" do
			expect(response.status).to eq(200)
		end

		it "renders the :index template" do
			expect(response).to render_template("index")
		end

		it "loads all projects into @projects" do
			project_1 = Project.create(name: '1', status: 'Completed', priority: 'N/A')
			project_2 = Project.create(name: '2', status: 'Completed', priority: 'N/A')
			expect(assigns(:projects)).to match_array([project_1, project_2])
		end
	end

  describe "GET#show" do
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

	describe "GET#new" do
		before :each do
			get :new
		end

		it "renders the :new template" do
			expect(response).to render_template("new")
		end

    it "assigns a new Project to @project" do
      expect(assigns(:project)).to be_a_new(Project)
    end
	end

	describe "DELETE#destroy" do
		before :each do
			allow(project).to receive(:destroy).and_return(true)
			delete :destroy, id: project
		end

		it "deletes the project" do
			expect(Project.exists?(project)).to be_false
		end

		it "redirects to Project#index" do
			expect(response).to redirect_to projects_path
		end
	end
end
