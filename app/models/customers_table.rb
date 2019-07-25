class CustomersTable < ApplicationRecord
  belongs_to :table
  belongs_to :customer
end
