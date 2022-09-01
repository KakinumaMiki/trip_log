class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.string :with_who
      t.text :comment
      t.integer :star

      t.timestamps
    end
  end
end
