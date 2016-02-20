class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :subtotal
      t.integer :tax
      t.integer :shipping
      t.integer :total
      t.references :order_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
