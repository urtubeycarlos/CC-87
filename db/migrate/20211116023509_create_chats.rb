class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.string :user1, null: false
      t.string :user2, null: false
      t.string :state, null: false

      t.timestamps
    end
  end
end
