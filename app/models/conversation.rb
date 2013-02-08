class Conversation < ActiveRecord::Base
  attr_accessible :description, :name, :postedByUser, :assigned_to

  validates :name, :presence => true, :length => { :minimum => 5 }
  validates :description, :presence => true

  has_many :comments, :dependent => :destroy

end
