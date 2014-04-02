class TasksController < ApplicationController

  def index
    @tasks, @task = Task.all, Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = 'Task has been created'
      redirect_to :back
    else
      flash[:alert] = 'Task has not been created'
      redirect_to :back
    end
  end

  private

    def task_params
      params.require(:task).permit(:description, :start_date, :target_date,
        :deadline, :completed)
    end
end