module ContactsHelper

  def phone_format phone
    if phone.nil? || phone.empty?
      'N/A'
    else
      number_to_phone(phone, area_code: true)
    end
  end
end
