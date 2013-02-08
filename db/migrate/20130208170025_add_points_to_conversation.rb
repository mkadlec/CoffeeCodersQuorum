class AddPointsToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :points, :integer
  end
end
