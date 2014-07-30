class ContactListPdf < PdfReport
  
  def initialize(contacts, view)
    super()
    @contacts, @view = contacts, view
    header 'Contact List'
    table_headers
    table_content
  end

  def table_headers
    [['Contact Name', 'Company', 'Office Phone', 'Mobile', 'Created']]
  end

  def table_column_widths
    [100, 145, 90, 90, 80]
  end

  def formatted_data
    @contacts.map do |contact|
      [contact.contact_name, data_format(contact.company),
        format_phone(contact.phone.office), format_phone(contact.phone.mobile),
        I18n.l(contact.created_at, format: :index_table)]
    end
  end

  def format_phone(phone)
    @view.number_to_phone(phone, area_code: true)
  end
end
