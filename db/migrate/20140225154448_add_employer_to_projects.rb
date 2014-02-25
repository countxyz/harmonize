class AddEmployerToProjects < ActiveRecord::Migration
  
  def change
    add_column :projects, :employer, :string
  end
end
