class AddActiveToSprint < ActiveRecord::Migration
  def change
  	add_column :sprints, :active, :boolean
  end
end
