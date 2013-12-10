module ContactsHelper

  def phone_format(phone)
    if phone == nil || phone.empty?
      phone = "N/A"
    else
      number_to_phone(phone, area_code: true)
    end
  end

  def data_format(data)
    if data == nil || data.empty?
      data = "N/A"
    else
      data
    end
  end
end
