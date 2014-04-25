class RemoveDetailFromTasks < ActiveRecord::Migration
  def change
    remove_reference :tasks, :user, index: true
  end
end
