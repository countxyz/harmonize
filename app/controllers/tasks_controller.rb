class TasksController < ApplicationController
  before_action :require_signin!
  before_action :all_tasks,         only: [:index, :create, :update, :destroy]
  before_action :set_task,          only: [:edit,  :update, :destroy         ]
  after_action  :verify_authorized, only: [:create, :update, :destroy        ]
  respond_to    :html, :js

  def new
    @task = Task.new
  end

  def create
    @task      = Task.create(task_params)
    @task.user = current_user
    authorize @task
  end

  def update
    authorize @task
    @task.update_attributes(task_params)
  end

  def destroy
    authorize @task
    @task.destroy
  end

  def completed
    @tasks = Task.completed_tasks
  end

  private

    def all_tasks
      @tasks = Task.pending
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :deadline, :completed, :user_id)
    end
end
