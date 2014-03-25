require 'spec_helper'

describe TransactionItem do
  it { should belong_to :product}
  it { should belong_to :transaction}

  describe '.sales_over_period' do
    it 'should return only the sales within a given time period' do
      transaction_item1 = TransactionItem.create(:product_id => 1, :quantity => 1, :transaction_id => 2)
      transaction_item2 = TransactionItem.create(:product_id => 3, :quantity => 2, :transaction_id => 3)
      transaction_item2.update(:created_at => '12-12-2001')
      TransactionItem.sales_over_period('01-01-2012', Time.now).should eq [transaction_item1]
    end
  end
end
