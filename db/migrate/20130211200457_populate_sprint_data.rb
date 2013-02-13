class PopulateSprintData < ActiveRecord::Migration
  def up
  	Sprint.create :name => "Sprint 1"
  	Sprint.create :name => "Sprint 2"
  end

  def down
  end
end
