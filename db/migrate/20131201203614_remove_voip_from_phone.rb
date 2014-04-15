class RemoveVoipFromPhone < ActiveRecord::Migration
  def change
    remove_column :phones, :voip, :string
  end
end
