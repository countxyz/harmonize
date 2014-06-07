module ApplicationHelper

  def full_title(page_title)
    base_title
    if page_title.empty? then base_title
    else "#{base_title} | #{page_title}"; end
  end

  def base_title
    'Harmonize'
  end

  def data_format data
    data.nil? || data.empty? ? 'N/A' : data
  end

  def phone_format(phone)
    phone.nil? || phone.empty? ? 'N/A' : number_to_phone(phone, area_code: true)
  end
end
