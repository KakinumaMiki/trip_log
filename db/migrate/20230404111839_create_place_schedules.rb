class CreatePlaceSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :place_schedules do |t|
      t.references :place, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true
      t.time :start_at

      t.timestamps
    end
  end
end
