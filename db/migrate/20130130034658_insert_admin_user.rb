class InsertAdminUser < ActiveRecord::Migration
  def up
  	User.new(:email => "mpk@mpk.com", :name => "admin", :password => "cough", :admin => true)
  end

  def down
  	User.delete_all(:email => "mpk@mpk.com")
  end
end