class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.string :user1
      t.string :user2
      t.string :state

      t.timestamps
    end
  end
end
