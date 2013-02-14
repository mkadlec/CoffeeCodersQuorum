class Conversation < ActiveRecord::Base
  attr_accessible :description, :name, :postedByUser, :assigned_to, :sprint, :points

  validates :name, :presence => true, :length => { :minimum => 5 }
  validates :description, :presence => true

  has_many :comments, :dependent => :destroy

  belongs_to :assigned, :class_name => "User", :foreign_key => "assigned_to"
  belongs_to :posted, :class_name => "User", :foreign_key => "postedByUser"

end



