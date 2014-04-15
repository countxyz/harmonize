class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :complete]
  respond_to :html, :js

  def index
    @tasks, @new_task = Task.pending, Task.new
  end

  def create
    @task = Task.create(task_params)
  end

  def update
    @task.update_attributes(task_params)
  end

  def destroy
    @task.destroy
  end

  def complete
    @task.update_attributes completed: Time.now
    redirect_to tasks_path
  end

  def completed
    @tasks = Task.completed_task
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :deadline, :completed)
    end
end
