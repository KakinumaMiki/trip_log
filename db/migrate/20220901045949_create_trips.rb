class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :prefecture

      t.timestamps
    end
  end
end
