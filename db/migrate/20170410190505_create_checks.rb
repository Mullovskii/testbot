class CreateChecks < ActiveRecord::Migration[5.0]
  def change
    create_table :checks do |t|
      t.references :bot, foreign_key: true
      t.references :lesson, foreign_key: true
      t.string :name
      t.string :key
      t.string :intent

      t.timestamps
    end
  end
end
