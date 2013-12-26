class AddSpaceToTime < ActiveRecord::Migration
  
  def change
    remove_column :events, :starttime,  :datetime
    remove_column :events, :endtime,    :datetime
    add_column    :events, :start_time, :datetime
    add_column    :events, :end_time,   :datetime
  end
end
