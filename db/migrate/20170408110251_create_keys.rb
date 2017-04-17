class CreateKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :keys do |t|
      t.integer :user_say_id
      t.references :bot, foreign_key: true
		  t.references :lesson, foreign_key: true
      t.string :name
      t.integer :sequence
      t.string :intent
      t.timestamps
    end
  end
end
