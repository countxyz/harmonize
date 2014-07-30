class ContactListPdf < PdfReport
  
  def initialize(contacts, view)
    super()
    @contacts, @view = contacts, view
    header 'Contact List'
    table_headers
    table_content
  end

  def table_headers
    [['Contact Name', 'Company', 'Office Phone', 'Mobile']]
  end

  def formatted_data
    @contacts.map do |contact|
      [contact.contact_name, data_format(contact.company),
        format_phone(contact.phone.office), format_phone(contact.phone.mobile)]
    end
  end

  def format_phone(phone)
    @view.number_to_phone(phone, area_code: true)
  end
end
