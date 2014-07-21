class ContactListPdf < PdfReport
  
  def initialize(contacts)
    super()
    @contacts = contacts
    header 'Contact List'
    table_headers
    table_content
  end

  def table_headers
    [['Contact Name', 'Company', 'Office Phone', 'Mobile']]
  end

  def formatted_data
    @contacts.map do |contact|
      [contact.name, data_format(contact.company),
        phone_format(contact.phone.office), phone_format(contact.phone.mobile)]
    end
  end
end
