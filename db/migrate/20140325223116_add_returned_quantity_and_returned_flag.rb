class AddReturnedQuantityAndReturnedFlag < ActiveRecord::Migration
  def change
    add_column :transaction_items, :returned_quantity, :integer
    add_column :transactions, :return_flag, :boolean
  end
end
