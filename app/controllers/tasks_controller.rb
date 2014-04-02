class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  private

    def task_params
      params.require(:task).permit(:description, :start_date, :target_date,
        :deadline, :completed)
    end
end