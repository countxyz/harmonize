class AccountListPdf < Prawn::Document

  def initialize(accounts)
    super()
    @accounts = accounts
    header
    table_content
  end

  def header
    text "Account List", size: 18, style: :bold, align: :center
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
    [['Account', 'Website', 'Email', 'Office Phone', 'Fax']] +
    @table_data ||= @accounts.map do |account|
      [account.name, account.website]
    end
  end
end
