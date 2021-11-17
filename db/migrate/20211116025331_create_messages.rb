class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :user_id, null: false
      t.text :detail, null: false
      t.boolean :modified, null: false

      t.timestamps
    end
  end
end
