class Comment < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  attr_accessible :body, :user_id, :user
end

