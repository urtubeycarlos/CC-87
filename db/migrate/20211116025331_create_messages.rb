class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :user_id
      t.text :detail
      t.boolean :modified

      t.timestamps
    end
  end
end
