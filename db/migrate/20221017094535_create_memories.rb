class CreateMemories < ActiveRecord::Migration[6.1]
  def change
    create_table :memories do |t|
      t.references :place, null: false, foreign_key: true
      t.date :went_on, null: false
      t.string :with_who
      t.text :comment
      t.decimal :star, null: false
      t.integer :price

      t.timestamps
    end
  end
end
