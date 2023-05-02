class AddColumnToPlaces < ActiveRecord::Migration[6.1]
  def up
    add_column :places, :creator, :string
    add_column :places, :status, :boolean
  end

  def down
    remove_column :places, :creator, :string
    remove_column :places, :status, :boolean
  end
end
