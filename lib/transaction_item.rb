class TransactionItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :transaction

  def self.sales_over_period(start_date, end_date)
    self.where(created_at: (start_date..end_date) )
  end
end
