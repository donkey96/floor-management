class RemoveCustomerFromTables < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tables, :customer
  end
end
