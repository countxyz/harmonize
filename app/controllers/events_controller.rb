class EventsController < ApplicationController

  def index   
  end
  
  def new
    @event = Event.new(:endtime => 1.hour.from_now, :period => "Does not repeat")
    render :json => {:form => render_to_string(:partial => 'form')}
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event has been created"
      redirect_to root_path
    else
      flash[:alert] = "Event has not been created"
      redirect_to :back
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
  
  def get_events
    @events = Event.find(:all, :conditions => [
      "starttime >= '#{Time.at(params['start'].to_i).to_formatted_s(:db)}' and endtime <= '#{Time.at(params['end'].to_i).to_formatted_s(:db)}'"] )
    events = [] 
    @events.each do |event|
      events << {:id => event.id, :title => event.title, :description => event.description || "Some cool description here...", :start => "#{event.starttime.iso8601}", :end => "#{event.endtime.iso8601}", :allDay => event.all_day, :recurring => (event.event_series_id)? true: false}
    end
    render :text => events.to_json
  end
  
  def move
    @event = Event.find(params[:id])
    if @event
      @event.starttime = (params[:minute_delta].to_i).minutes.from_now(
        (params[:day_delta].to_i).days.from_now(@event.starttime))
      @event.endtime = (params[:minute_delta].to_i).minutes.from_now(
        (params[:day_delta].to_i).days.from_now(@event.endtime))
      @event.all_day = params[:all_day]
      @event.save
    end
    render :nothing => true
  end
  
  
  def resize
    @event = Event.find(params[:id])
    if @event
      @event.endtime = (params[:minute_delta].to_i).minutes.from_now(
        (params[:day_delta].to_i).days.from_now(@event.endtime))
      @event.save
    end    
    render :nothing => true
  end  

  private
    def event_params
      params.require(:event).permit(:title, :description, 
                                    :starttime, :endtime, :all_day)
    end  
end
