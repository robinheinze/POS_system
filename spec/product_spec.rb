require 'spec_helper'

describe Product do
  it { should have_many :transactions }

  describe 'total_quantity' do
  	it 'should return the total quantity sold of this product' do
  		product = Product.create(:name => 'widget', :price => 5.00)
  		transaction = Transaction.create(:cashier_id => 2)
  		transaction_item1 = TransactionItem.create(:product_id => product.id, :transaction_id => transaction.id, :quantity => 2)
  		transaction_item2 = TransactionItem.create(:product_id => product.id, :transaction_id => transaction.id, :quantity => 3)
  		product.total_quantity.should eq 5
  	end
  end

  describe 'total_returned' do
  	it 'returns the total quantity returned of this product' do
  		product = Product.create(:name => 'widget', :price => 5.00)
  		transaction = Transaction.create(:cashier_id => 2)
  		transaction_item1 = TransactionItem.create(:product_id => product.id, :transaction_id => transaction.id, :quantity => 2)
  		transaction_item2 = TransactionItem.create(:product_id => product.id, :transaction_id => transaction.id, :quantity => 3, :returned_quantity => 3)
  		transaction.update(:return_flag => true)
  		product.total_returned.should eq 3
  	end
  end
end
