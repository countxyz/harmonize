class PdfReport < Prawn::Document
  include ApplicationHelper

  def header(title)
    text title, size: 18, style: :bold, align: :center
    move_down 25
  end

  def table_data
    table_headers + formatted_data
  end

  def table_content
    table table_data,
      cell_style: { size: 9 },
      header: true,
      row_colors: ['DDDDDD', 'FFFFFF'],
      column_widths: [100, 125, 125, 70, 70]
  end
end
