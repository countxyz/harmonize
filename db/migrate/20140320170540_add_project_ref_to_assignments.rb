class AddProjectRefToAssignments < ActiveRecord::Migration
  def change
    add_reference :assignments, :project, index: true
  end
end
