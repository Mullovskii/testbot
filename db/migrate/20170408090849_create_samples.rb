class CreateSamples < ActiveRecord::Migration[5.0]
  def change
    create_table :samples do |t|
      t.references :user_say, foreign_key: true
      t.references :bot, foreign_key: true
      t.references :key, foreign_key: true
      t.string :name
      t.string :key_name
      t.integer :sequence

      t.timestamps
    end
  end
end
