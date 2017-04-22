class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      # t.references :user, foreign_key: true
      t.references :bot, foreign_key: true
      t.references :lesson, foreign_key: true
      t.string :intent
      t.string :filter
      t.integer :sequence
      t.boolean :waiting_response
      t.string :title
      t.text :body
      t.string :link
      t.string :photo
      t.string :token
      t.boolean :proactive, default: false
      t.timestamps
    end
  end
end
