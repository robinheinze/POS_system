class Cashier < ActiveRecord::Base
  has_many :transactions

  def total_transactions(start_date, end_date)
  	# puts transactions[7].created_at < end_date
  	# puts transactions[7].created_at >= start_date
  	# array = (1..10).to_a
  	# array.count{ |x| x >= 2 && x < 4}
  	# transactions.each{ |x| puts x.created_at}
  	# transactions.count{ |x| (x.created_at >= start_date && x.created_at < end_date) }
  	selected_transactions = transactions.select{ |x| x.created_at >= start_date && x.created_at < end_date}
  	selected_transactions.length
  end
end
