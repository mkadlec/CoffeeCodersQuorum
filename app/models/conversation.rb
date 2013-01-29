class Conversation < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name, :presence => true, :length => { :minimum => 5 }
  validates :description, :presence => true
end
