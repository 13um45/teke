class RemoveProductFromCharge < ActiveRecord::Migration
  def change
    remove_reference :charges, :product, index: true, foreign_key: true
  end
end
