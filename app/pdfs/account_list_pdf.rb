class AccountListPdf < PdfReport

  def initialize(accounts)
    super()
    @accounts = accounts
    header 'Account List'
    table_headers
    table_content
  end

  def table_headers
    [['Account', 'Website', 'Location', 'Created', 'Status']]
  end

  def formatted_data
    @accounts.map do |account|
      [
        account.name,
        data_format(account.website),
        data_format(account.company_location),
        I18n.l(account.created_at, format: :index_table),
        status_format(account.active)
      ]
    end
  end
end
