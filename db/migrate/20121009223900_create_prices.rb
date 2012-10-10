class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :quantity
      t.integer :amount
      t.references :product

      t.timestamps
    end
    add_index :prices, :product_id
  end
end
