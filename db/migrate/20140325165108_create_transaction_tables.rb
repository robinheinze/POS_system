class CreateTransactionTables < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.belongs_to :cashier

      t.timestamps
    end

    create_table :transaction_items do |t|
      t.belongs_to :product
      t.belongs_to :transaction
      t.column :quantity, :integer

      t.timestamps
    end
  end
end
