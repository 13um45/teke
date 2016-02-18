class Charge < ActiveRecord::Base
  belongs_to :product

    def process_payment
    customer = Stripe::Customer.create email: email,
                                       card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: product.price * 100,
                          description: product.name,
                          currency: 'usd'
  end

end
