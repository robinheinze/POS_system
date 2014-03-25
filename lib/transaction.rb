class Transaction < ActiveRecord::Base
  belongs_to :cashier
  has_many :transaction_items
  has_many :products, {:through => :transaction_items}
end
