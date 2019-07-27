class Customer < ApplicationRecord
  has_many :customers_tables
  has_many :tables, through: :customers_tables
end
