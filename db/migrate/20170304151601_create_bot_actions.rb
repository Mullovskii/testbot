class CreateBotActions < ActiveRecord::Migration[5.0]
  def change
    create_table :bot_actions do |t|
      t.string :user_input
      t.string :bot_response
      t.string :intent
      t.integer :context_number
      t.references :user, foreign_key: true
      t.references :bot, foreign_key: true


      t.timestamps
    end
  end
end
