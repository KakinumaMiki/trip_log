class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.references :prefecture, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name, null: false
      t.string :address
      t.boolean :gone, null: false
      t.text :memo

      t.timestamps
    end
  end
end
