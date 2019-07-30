class AddIndexToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_index :customers, :tel
    add_index :customers, :day
  end
end
