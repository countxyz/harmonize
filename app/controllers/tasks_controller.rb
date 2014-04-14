class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks, @task = Task.pending, Task.new
  end

  def create
    @task = Task.create(task_params)

    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js
    end
  end

  def edit; end

  def update; end

  def destroy
    @task.destroy
    
    respond_to do |format|
      format.html { redirect_to @task }
      format.js
    end
  end

  def completed; end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :deadline, :completed)
    end
end