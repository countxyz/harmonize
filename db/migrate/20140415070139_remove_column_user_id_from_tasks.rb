class RemoveColumnUserIdFromTasks < ActiveRecord::Migration
  def change
    remove_reference :tasks, :user
  end
end
