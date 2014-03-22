class ProjectsController < ApplicationController

  def index
    @projects = Project.all 
  end

  def show
    @project = Project.find(params[:id])
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

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:notice] = 'Project has been updated'
      redirect_to @project
    else
      flash[:alert] = 'Project has not been updated'
      render :action => 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = 'Project has been deleted'
    redirect_to projects_path
  end

  private

    def project_params
      params.require(:project).permit(:name, :status, :website, :role, :employer,
        :image, :priority, :start_date, :target_date, :deadline, :completion_date,
        :notes)
    end
end
