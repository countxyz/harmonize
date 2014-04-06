class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:destroy]
  before_action :set_project,    only: [:index, :create]

  def index
    @assignments, @assignment = Assignment.all, @project.assignments
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = @project.assignments.new(assignment_params)

    if @project.save
      flash[:notice] = 'Assignment has been added'
      redirect_to :back
    else
      flash[:alert] = 'Assignment has not been added'
      redirect_to :back
    end
  end

  def edit; end

  private

    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def assignment_params
      params.require(:assignment).permit(:description, :status, :priority,
        :start_date, :target_date, :deadline, :completed, :notes)
    end
end
