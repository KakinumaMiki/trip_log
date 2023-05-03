class AddColumnToPlans < ActiveRecord::Migration[6.1]
  def up
    add_reference :plans, :user
    add_column :plans, :status, :boolean
  end

  def down
    remove_reference :plans, :user
    remove_column :plans, :status, :boolean
  end
end
