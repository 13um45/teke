class AddEmailToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :email, :string
  end
end
