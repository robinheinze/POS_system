require 'spec_helper'


describe Transaction do
  it { should have_many :products }
  it { should belong_to :cashier }
end
