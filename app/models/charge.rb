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

    c = customer.sources.first
    self.name = c.name
    self.address1 = c.address_line1
    self.address2 = c.address_line2
    self.city = c.address_city
    self.state = c.address_state
    self.zip = c.address_zip
    self.country = c.address_country
    self.customer_id = customer.id
  end

end
