class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.date :end_date
      t.string :with_who
      t.text :memo

      t.timestamps
    end
  end
end
