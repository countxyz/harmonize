require 'spec_helper'

describe ProjectsController do

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
      project = create(:project)
      expect(assigns(:projects)).to match_array [project]
		end
	end

  describe "GET#show" do
    before :each do 
      @project = create(:project)
      get :show, id: @project
    end

    it "renders the :show template" do
      expect(response).to render_template("show")
    end

    it "assigns the requested project to @project" do
      expect(assigns(:project)).to eq(@project)
    end
  end

	describe "GET#new" do
		before(:each) { get :new }

		it "renders the :new template" do
			expect(response).to render_template("new")
		end

    it "assigns a new Project to @project" do
      expect(assigns(:project)).to be_a_new(Project)
    end
	end

  describe "POST#create" do
    context "with valid attributes" do
      before :each do
        post :create, project: attributes_for(:project)
      end

      it "creates a new project" do
        expect(Project.exists?(assigns[:project])).to be_true
      end

      it "redirects to the new project" do
        expect(response).to redirect_to Project.last
      end
    end

    context "with invalid attributes" do
      before :each do
        post :create, project: attributes_for(:invalid_project)
      end

      it "does not save the new project" do
        expect(Project.exists?(assigns[:project])).to be_false
      end

      it "renders the new project template again" do
        expect(response).to render_template :new
      end
    end
  end

  describe "GET#show" do
    before :each do 
      @project = create(:project)
      get :edit, id: @project
    end

    it "renders the :edit template" do
      expect(response).to render_template("edit")
    end

    it "assigns the requested project to @project" do
      expect(assigns(:project)).to eq(@project)
    end
  end

  describe "PUT#update" do
    before(:each) { @project = create(:project) }

    context "with valid attributes" do
      it "locates the requested @project" do
        put :update, id: @project, project: attributes_for(:project)
        expect(assigns(:project)).to eq(@project)
      end

      it "changes @project's attributes" do
        put :update, id: @project, project: attributes_for(:project)
        @project.reload
        expect(assigns(:project)).to eq(@project)
      end

      it "redirects to the updated project" do
        put :update, id: @project, project: attributes_for(:project)
        expect(response).to redirect_to @project
      end
    end

    context "with invalid attributes" do
      it "locates the requested @project" do
        put :update, id: @project, project: attributes_for(:invalid_project)
        expect(assigns(:project)).to eq(@project)
      end

      it "does not change @project's attributes" do
        put :update, id: @project, project: attributes_for(:invalid_project)
        @project.reload
        expect(assigns(:invalid_project)).to_not eq(@project)
      end

      it "renders the new project template again" do
        put :update, id: @project, project: attributes_for(:invalid_project)
        expect(response).to render_template :edit
      end
    end
  end


	describe "DELETE#destroy" do
    before(:each) { @project = create(:project) }

		it "deletes the project" do
			expect{ delete :destroy, id: @project }.to change(Project, :count).by(-1)
		end

		it "redirects to Project#index" do
      delete :destroy, id: @project
			expect(response).to redirect_to projects_url
		end
	end
end
