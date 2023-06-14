class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :code
      t.string :password_digest
      t.integer :role, default: 0, null: false

      t.timestamps
    end
    add_index :users, :code, unique: true
  end
end
