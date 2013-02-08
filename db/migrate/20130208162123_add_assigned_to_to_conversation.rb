class AddAssignedToToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :assigned_to, :integer
  end
end
