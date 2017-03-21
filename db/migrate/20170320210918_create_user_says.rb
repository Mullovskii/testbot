class CreateUserSays < ActiveRecord::Migration[5.0]
  def change
    create_table :user_says do |t|
      t.string :input
      t.string :intent
      t.references :lesson, foreign_key: true
      t.references :user, foreign_key: true
      t.references :bot, foreign_key: true

      t.timestamps
    end
  end
end
