class CreateAttachements < ActiveRecord::Migration[5.0]
  def change
    create_table :attachements do |t|
      t.references :bot_action, foreign_key: true
      t.integer :attachable_id
      t.string :attachable_type
      t.references :bot, foreign_key: true

      t.timestamps
    end
  end
end
