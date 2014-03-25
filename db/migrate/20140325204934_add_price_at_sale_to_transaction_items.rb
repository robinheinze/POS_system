class AddPriceAtSaleToTransactionItems < ActiveRecord::Migration
  def change
    add_column :transaction_items, :item_price_at_sale, :decimal, :precision => 8, :scale => 2
  end
end
