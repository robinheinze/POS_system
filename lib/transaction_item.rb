class TransactionItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :transaction

  def self.sales_over_period(start_date, end_date)
    sales = self.where(created_at: (start_date..end_date) )
    total = 0.00
    sales.each { |sale| total += (sale.item_price_at_sale * (sale.quantity - sale.returned_quantity)) }
    total
  end
end
