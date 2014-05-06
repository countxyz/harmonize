class Account < ActiveRecord::Base
  validates :name, presence: true, length: { in: 2..50 }
  
  validates :website, allow_blank: true, length: { in: 6..50 }
  
  validates :phone, allow_blank: true, numericality: { only_integer: true },
            length: { is: 10 }
  
  validates :fax, allow_blank: true, numericality: { only_integer: true },
            length: { is: 10 }

  validates :email, allow_blank: true, length: { in: 5..50 }

  validates :notes, allow_blank: true, length: { in: 2..1000 }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |account|
        csv << account.attributes.values_at(*column_names)
      end
    end
  end
end
