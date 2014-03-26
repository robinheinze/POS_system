class Product < ActiveRecord::Base
  has_many :transaction_items
  has_many :transactions, {:through => :transaction_items}

  def total_quantity
  	transaction_items.sum('quantity')
  end

  def total_returned
  	transaction_items.sum('returned_quantity')
  end
end
