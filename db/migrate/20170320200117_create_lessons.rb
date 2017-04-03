class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      # t.string :user_say
      t.string :intent
      t.boolean :user_proactive, default: true
      t.references :bot, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :extract_data, default: false
      t.timestamps
    end
  end
end
