class CreateActs < ActiveRecord::Migration[5.0]
  def change
    create_table :acts do |t|
      t.string :bot_say
      t.string :intent
      t.string :link
      t.boolean :yes_no, default: false
      t.references :lesson, foreign_key: true
      t.references :bot, foreign_key: true
      t.references :user, foreign_key: true
      t.time :shoot_at
      t.boolean :recurrent, default: false
      t.timestamps
    end
  end
end
