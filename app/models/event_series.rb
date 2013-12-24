class EventSeries < ActiveRecord::Base
  attr_accessor :title, :description, :commit_button
  
  validates_presence_of :frequency, :period, :starttime, :endtime,
                        :title, :description
  
  has_many :events, dependent: :destroy

  after_create :create_events_until_end_time
  
  def create_events_until_end_time(end_time=END_TIME)
    st = starttime
    et = endtime
    p = r_period(period)
    nst, net = st, et
    
    while frequency.send(p).from_now(st) <= end_time
      self.events.create(:title => title, :description => description, :all_day => all_day, :starttime => nst, :endtime => net)
      nst = st = frequency.send(p).from_now(st)
      net = et = frequency.send(p).from_now(et)
      
      if period.downcase == 'monthly' or period.downcase == 'yearly'
        begin 
          nst = DateTime.parse("#{starttime.hour}:#{starttime.min}:#{starttime.sec}, #{starttime.day}-#{st.month}-#{st.year}")  
          net = DateTime.parse("#{endtime.hour}:#{endtime.min}:#{endtime.sec}, #{endtime.day}-#{et.month}-#{et.year}")
        rescue
          nst = net = nil
        end
      end
    end
  end
  
  def r_period(period)
    case period
      when 'Daily'
      p = 'days'
      when "Weekly"
      p = 'weeks'
      when "Monthly"
      p = 'months'
      when "Yearly"
      p = 'years'
    end
    return p
  end 
end
