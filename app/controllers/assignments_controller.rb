class AssignmentsController < ApplicationController

  def new
    @assignment = Assignment.new
  end

  def create
    @project = Project.find(params[:project_id])
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

    def assignment_params
      params.require(:assignment).permit(:description, :status, :priority,
        :start_date, :target_date, :deadline, :completed, :notes)
    end
end
