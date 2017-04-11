class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :bot, foreign_key: true
      t.references :lesson, foreign_key: true
      t.string :intent
      t.integer :sequence
      t.string :name
      t.string :place
      t.text :description
      t.string :organizer
      t.boolean :free
      t.integer :price
      t.string :link
      t.string :photo
      t.string :token

      t.timestamps
    end
  end
end
