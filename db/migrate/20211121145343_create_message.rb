class CreateMessage < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :user
      t.string :text
       
      t.timestamps
    end
  end
end
