require 'spec_helper'

describe TransactionItem do
  it { should belong_to :product}
  it { should belong_to :transaction}

  it { should validate_presence_of :transaction}
  it { should validate_presence_of :product}

  describe '.sales_over_period' do
    it 'should return the total sales within a given time period' do
      product = Product.create(:name => 'widget', :price => 5.00)
      transaction1 = Transaction.create(:cashier_id => 1)
      transaction_item1 = TransactionItem.create(:product_id => product.id, :quantity => 1, :transaction_id => transaction1.id, :returned_quantity => 0, :item_price_at_sale => 5.00)
      transaction2 = Transaction.create(:cashier_id => 1)
      transaction_item2 = TransactionItem.create(:product_id => product.id, :quantity => 2, :transaction_id => transaction2.id, :returned_quantity => 0, :item_price_at_sale => 5.00)
      transaction_item2.update(:created_at => '12-12-2001')
      TransactionItem.sales_over_period('01-01-2012', Time.now).should eq 5.00
    end
  end

  describe 'return' do
    it 'sets the returned quantity to the given quatity if it is less than the original quantity' do
      product = Product.create(:name => 'widget', :price => 5.00)
      transaction = Transaction.create(:cashier_id => 1)
      transaction_item1 = TransactionItem.create(:product_id => product.id, :quantity => 10, :transaction_id => transaction.id, :returned_quantity => 0, :item_price_at_sale => 5.00)     
      transaction_item1.return(5).should eq true
      transaction_item1.returned_quantity.should eq 5
    end

    # it 'sets the return flag on the parent transaction' do
    #   product = Product.create(:name => 'widget', :price => 5.00)
    #   transaction = Transaction.create(:cashier_id => 1)
    #   transaction_item1 = TransactionItem.create(:product_id => product.id, :quantity => 10, :transaction_id => transaction.id, :returned_quantity => 0, :item_price_at_sale => 5.00)
    #   transaction_item1.return(5)
    #   transaction_item1.transaction.return_flag.should eq true
    # end

    # it 'returns false and changes no values if the given quantity is greater than the original sold quantity' do

    # end
  end
end
