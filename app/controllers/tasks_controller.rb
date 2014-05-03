class TasksController < ApplicationController
  before_action :require_signin!
  before_action :set_task, only: [:edit, :update, :destroy, :complete]
  respond_to :html, :js

  def index
    @tasks = Task.pending
  end

  def new
    @task = Task.new
  end

  def create
    @tasks = Task.pending
    @task = Task.create(task_params)
  end

  def edit; end

  def update
    @tasks = Task.pending
    @task.update_attributes(task_params)
  end

  def destroy
    @task.destroy
  end

  def complete
    @task.update_attributes completed: Time.now
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
