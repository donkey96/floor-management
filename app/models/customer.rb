class Customer < ApplicationRecord
  has_many :customers_tables
  has_many :tables, through: :customers_tables

  validates :name, presence: true
  validates :tel, presence: true
end
