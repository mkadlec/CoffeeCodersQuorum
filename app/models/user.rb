class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  validates_presence_of :name
  validates_uniqueness_of :name
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me
  attr_accessible :email, :name, :password, :admin

  has_many :conversations
  has_many :comments

end
