require 'spec_helper'

describe TransactionItem do
  it { should belong_to :product}
  it { should belong_to :transaction}

  describe '.sales_over_period' do
    it 'should return the total sales within a given time period' do
      product = Product.create(:name => 'widget', :price => 5.00)
      transaction_item1 = TransactionItem.create(:product_id => product.id, :quantity => 1, :transaction_id => 2, :returned_quantity => 0, :item_price_at_sale => 5.00)
      transaction_item2 = TransactionItem.create(:product_id => product.id, :quantity => 2, :transaction_id => 3, :returned_quantity => 0, :item_price_at_sale => 5.00)
      transaction_item2.update(:created_at => '12-12-2001')
      TransactionItem.sales_over_period('01-01-2012', Time.now).should eq 5.00
    end
  end
end
