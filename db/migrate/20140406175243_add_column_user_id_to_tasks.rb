class AddColumnUserIdToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :user_id, :integer
  end
end
