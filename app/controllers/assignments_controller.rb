class AssignmentsController < ApplicationController
  before_action :set_project, only: [:index, :create]

  def index
    @assignments = Assignment.all
    @assignment = @project.assignments
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @project.add_assignment(@project, @assignment)

    if @project.save
      flash[:notice] = 'Assignment has been added'
      redirect_to :back
    else
      flash[:alert] = 'Assignment has not been added'
      redirect_to :back
    end
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def assignment_params
      params.require(:assignment).permit(:description, :status, :priority,
        :start_date, :target_date, :deadline, :completed, :notes)
    end
end
