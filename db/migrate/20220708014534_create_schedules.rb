class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.date :date, null: false
      t.time :start_time, null: false
      t.integer :ticket_number
      t.references :program, null:false
      t.timestamps
    end
  end
end