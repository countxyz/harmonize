class EventsController < ApplicationController
  before_action :require_signin!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show; end
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = 'Event has been created'
      redirect_to @event
    else
      flash[:alert] = 'Event has not been created'
      render :action => 'new'
    end
  end

  def edit; end

  def update
    if @event.update_attributes(event_params)
      flash[:notice] = 'Event has been updated'
      redirect_to @event
    else
      flash[:alert] = 'Event has not been updated'
      render :action => 'edit'
    end   
  end

  def destroy
    @event.destroy
    flash[:notice] = 'Event has been deleted.'
    redirect_to @event
  end 

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, 
                                    :start_time, :end_time, :all_day)
    end  
end
