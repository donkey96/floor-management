class Table < ApplicationRecord
  belongs_to :user
  has_many :customers_tables
  has_many :customers, through: :customers_tables
end
