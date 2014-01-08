class ChangeSprintDateNames < ActiveRecord::Migration
  def change
  	rename_column :sprints, :start, :startDate
  	rename_column :sprints, :end, :endDate
  end

  def down
  end
end
