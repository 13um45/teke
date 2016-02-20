class AddColumnsToCharge < ActiveRecord::Migration
  def change
    add_column :charges, :name, :string
    add_column :charges, :address1, :string
    add_column :charges, :address2, :string
    add_column :charges, :city, :string
    add_column :charges, :state, :string
    add_column :charges, :zip, :string
    add_column :charges, :country, :string
    add_column :charges, :customer_id, :string
  end
end
