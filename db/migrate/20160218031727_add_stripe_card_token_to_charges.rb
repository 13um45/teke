class AddStripeCardTokenToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :card_token, :string
  end
end
