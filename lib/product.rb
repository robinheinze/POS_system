class Product < ActiveRecord::Base
  has_many :transaction_items
  has_many :transactions, {:through => :transaction_items}
end
