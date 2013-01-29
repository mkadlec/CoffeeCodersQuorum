class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
