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
			flash[:notice] = "Project has been created."
			redirect_to @project
		else
			flash[:alert] = "Project has not been created."
			render :action => "new"
		end
	end

	private

		def project_params
			params.require(:project).permit(:name, :status, :priority,
																			:start_date, :target_date,
																			:deadline, :completion_date,
																			:notes)
		end
end
