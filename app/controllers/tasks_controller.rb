class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :complete]

  def index
    @tasks, @new_task = Task.pending, Task.new
  end

  def create
    @task = Task.create(task_params)

    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js
    end
  end

  def edit
  end

  def update
    if @task.update_attributes(task_params)
      flash[:notice] = 'Task has been updated'
      render action: 'index'
    else
      flash[:alert] = 'Task has not been updated'
      render action: 'edit'
    end
  end

  def destroy
    @task.destroy
    
    respond_to do |format|
      format.html { redirect_to @task }
      format.js
    end
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