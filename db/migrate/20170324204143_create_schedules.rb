class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.references :bot, foreign_key: true
      t.references :lesson, foreign_key: true
      t.string :intent
      t.integer :sequence
      t.boolean :waiting_response
      t.integer :time
      t.boolean :repeat
      t.boolean :repeat_daily
      t.integer :remind_over
      t.boolean :sunday
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday

      t.timestamps
    end
  end
end
