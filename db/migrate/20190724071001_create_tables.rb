class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.string :name, null: false, unique: true
      t.references :user, foreign_key: true
      t.references :customer
      t.timestamps
    end
  end
end
