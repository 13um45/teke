class Charge < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

    def process_payment
    customer = Stripe::Customer.create email: email,
                                       card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: order.subtotal * 100,
                          description: order.id,
                          currency: 'usd'
  end

end
