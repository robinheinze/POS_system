class TransactionItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :transaction

  validates :transaction, :presence => true
  validates :product, :presence => true

  def self.sales_over_period(start_date, end_date)
    sales = self.where(created_at: (start_date..end_date) )
    total = 0.00
    sales.each { |sale| total += (sale.item_price_at_sale * (sale.quantity - sale.returned_quantity)) }
    total
  end

  def return(quantity)
  	if self.quantity < quantity
  		result = false
  	else
 			self.update(:returned_quantity => quantity)
 			self.transaction.update(:return_flag => true)
 			result = true
 		end
 		result
  end
end
