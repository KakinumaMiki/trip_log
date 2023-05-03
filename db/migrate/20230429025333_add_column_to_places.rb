class AddColumnToPlaces < ActiveRecord::Migration[6.1]
  def up
    add_reference :places, :user
    add_column :places, :status, :boolean
  end

  def down
    remove_reference :places, :user
    remove_column :places, :status, :boolean
  end
end
