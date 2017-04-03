class CreateEntities < ActiveRecord::Migration[5.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :key
      t.references :user, foreign_key: true
      t.references :bot, foreign_key: true
      t.string :intent

      t.timestamps
    end
  end
end
