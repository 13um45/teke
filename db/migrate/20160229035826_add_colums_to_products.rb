class AddColumsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :ring, :boolean
    add_column :products, :necklace, :boolean
    add_column :products, :earring, :boolean
    add_column :products, :bracelet, :boolean
  end
end
