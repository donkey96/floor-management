class CreateCustomersTables < ActiveRecord::Migration[5.2]
  def change
    create_table :customers_tables do |t|
      t.references :customer
      t.references :table
      t.timestamps
    end
  end
end
