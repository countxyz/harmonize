class ContactListPdf < Prawn::Document
  
  def initialize(contacts)
    super()
    @contacts = contacts
    header
    table_content
  end

  def header
    text "Contact List", size: 18, style: :bold, align: :center
    move_down 25
  end

  def table_content
    table table_data,
      cell_style: { size: 9 },
      header: true,
      row_colors: ['DDDDDD', 'FFFFFF'],
      column_widths: [100, 125, 125, 70, 70]
  end

  def table_data
    [['Contact Name', 'Company', 'Email', 'Office Phone', 'Mobile Phone']] +
    @table_data ||= @contacts.map do |contact|
      [contact.name, contact.company,
        contact.phone.nil? ? 'N/A' : contact.phone.office,
        contact.phone.nil? ? 'N/A' : contact.phone.mobile]
    end
  end
end
