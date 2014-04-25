class RemoveUserNumberFromProjects < ActiveRecord::Migration
  def change
    remove_reference :projects, :user, index: true
  end
end
