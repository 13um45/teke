class AddOrderToCharge < ActiveRecord::Migration
  def change
    add_reference :charges, :order, index: true, foreign_key: true
  end
end
