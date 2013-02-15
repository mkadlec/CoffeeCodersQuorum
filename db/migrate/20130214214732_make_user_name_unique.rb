class MakeUserNameUnique < ActiveRecord::Migration
  def up
    add_index :users, :name, :unique => true
  end

  def down
  end
end
