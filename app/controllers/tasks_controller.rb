class TasksController < ApplicationController
  before_action :set_task, only: [:destroy]

  def index
    @tasks, @task = Task.all, Task.new
  end

  def create
    @task = Task.create(task_params)

    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js
    end
  end

  def destroy
    @task.destroy
    
    respond_to do |format|
      format.html { redirect_to @task }
      format.js
    end
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :deadline, :completed)
    end
end