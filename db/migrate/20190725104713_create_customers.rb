class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :tel, null: false
      t.string :time
      t.string :people
      t.text :text
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
