class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :conversation

      t.timestamps
    end
    add_index :comments, :conversation_id
  end
end
