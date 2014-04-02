class TasksController < ApplicationController

  def index
    @tasks, @task = Task.all, Task.new
  end

  private

    def task_params
      params.require(:task).permit(:description, :start_date, :target_date,
        :deadline, :completed)
    end
end