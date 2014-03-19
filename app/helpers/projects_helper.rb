module ProjectsHelper
  
  def table_date_format date
    if date.nil?
      'N/A'
    else
      date.strftime("%m/%d/%Y")
    end
  end

  def profile_date_format date
    if date.nil?
      'N/A'
    else
      date.strftime("%B %d, %Y")
    end
  end
end
