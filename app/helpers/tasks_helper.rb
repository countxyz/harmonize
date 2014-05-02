module TasksHelper

  def datetime_format(datetime)
    if datetime.nil? then 'No Deadline'
    else
      datetime.strftime('%B %d, %Y - %A %l:%M %P %Z')
    end
  end
end