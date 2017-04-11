class CreateKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :keys do |t|
      t.references :user_say, foreign_key: true
      t.references :bot, foreign_key: true
		t.references :lesson, foreign_key: true
      t.string :name
        t.integer :sequence


      t.timestamps
    end
  end
end
