class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
  end
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event has been created"
      redirect_to root_path
    else
      flash[:alert] = "Event has not been created"
      render :action => "new"
    end
  end

  def edit
    @event = Event.find(params[:id])
    render :json => { :form => render_to_string(:partial => 'edit_form') } 
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:notice] = "Event has been updated"
      redirect_to root_path
    else
      flash[:alert] = "Event has not been updated"
      render :action => "edit"
    end   
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event has been deleted."
    redirect_to root_path
  end 

  private
    def event_params
      params.require(:event).permit(:title, :description, 
                                    :start_time, :end_time, :all_day)
    end  
end
