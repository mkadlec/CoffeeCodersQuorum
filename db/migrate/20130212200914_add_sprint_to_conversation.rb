class AddSprintToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :sprint, :integer
  end
end
