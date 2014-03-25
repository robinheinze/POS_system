require 'spec_helper'

describe TransactionItem do
  it { should belong_to :product}
  it { should belong_to :transaction}
end
