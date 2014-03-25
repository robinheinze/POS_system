require 'rspec'
require 'active_record'
require 'cashier'
require 'product'
require 'transaction'
require 'transaction_item'
require 'shoulda-matchers'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

RSpec.configure do |config|
  config.after(:each) do
    Product.all.each { |product| product.destroy }
    Cashier.all.each { |cashier| cashier.destroy }
    Transaction.all.each { |transaction| transaction.destroy }
    TransactionItem.all.each { |item| item.destroy }
  end
end
