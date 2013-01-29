class AddPostedByUserToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :postedByUser, :integer
  end
end
