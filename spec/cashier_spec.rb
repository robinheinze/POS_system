require 'spec_helper'

describe Cashier do
  it { should have_many :transactions }

  describe 'total_transactions' do
  	it 'should return the number of transactions a cashier performed in the given time period' do
  		cashier = Cashier.create(:name => 'Maggie')
  		10.times do |i|
  			Transaction.create(:cashier_id => cashier.id, :created_at => (Date.today - i))
  		end 
  		cashier.total_transactions('2014-03-21', '2014-03-23').should eq 2
  	end
  end
end
