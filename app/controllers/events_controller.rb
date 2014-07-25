class EventsController < ApplicationController
  before_action :require_signin!
  before_action :set_event,         only: [:edit, :update, :delete, :destroy]
  after_action  :verify_authorized, only: [:create, :update, :destroy]
  respond_to    :html, :js, :json

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event      = Event.create(event_params)
    @event.user = current_user
    authorize @event
  end

  def update
    @event.update_attributes(event_params)
    authorize @event
  end

  def destroy 
    @event.destroy
    authorize @event
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:id, :name, :description, :start, :finish,
        :all_day, :user_id)
    end
end