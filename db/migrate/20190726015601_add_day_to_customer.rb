class AddDayToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :day, :string
  end
end
