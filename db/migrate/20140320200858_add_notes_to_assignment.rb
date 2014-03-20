class AddNotesToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :notes, :string
  end
end
