class AddTackingToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :tracking, :string
  end
end
