class CreateTables < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :price, :decimal, :precision => 8, :scale => 2

      t.timestamps
    end

    create_table :cashiers do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
