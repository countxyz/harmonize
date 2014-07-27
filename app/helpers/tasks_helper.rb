module TasksHelper

  def task_datetime_format(datetime)
    if datetime.nil?
      'No Deadline'
    else
      datetime.strftime('%B %e, %Y %l:%M %P %Z')
    end
  end
end
