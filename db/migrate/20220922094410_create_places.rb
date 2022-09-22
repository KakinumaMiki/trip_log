class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.references :prefecture, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.boolean :gone
      t.text :memo

      t.timestamps
    end
  end
end
