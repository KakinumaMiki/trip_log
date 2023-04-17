class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :plan, null: false, foreign_key: true
      t.string :name, null: false
      t.text :memo
      t.date :went_on

      t.timestamps
    end
  end
end
