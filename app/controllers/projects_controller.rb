class ProjectsController < ApplicationController
  before_action :require_signin!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.list_by_recent
  end

  def show
    @assignment, @assignments = @project.assignments.build, @project.assignments
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = 'Project has been created'
      redirect_to @project
    else
      flash[:alert] = 'Project has not been created'
      render :action => 'new'
    end
  end

  def edit; end

  def update
    if @project.update_attributes(project_params)
      flash[:notice] = 'Project has been updated'
      redirect_to @project
    else
      flash[:alert] = 'Project has not been updated'
      render :action => 'edit'
    end
  end

  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to @project }
      format.js { head :no_content }
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :website, :github, :employer,
        :image, :notes)
    end
end
