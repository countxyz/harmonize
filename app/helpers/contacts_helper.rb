module ContactsHelper

  def phone_format phone
    if phone.nil?
      'N/A'
    else
      number_to_phone(phone, area_code: true)
    end
  end
end
