class Charge < ActiveRecord::Base
  belongs_to :order
  validates_presence_of :tracking, :on => :update
  validates :tracking, :tracking_number => true, :on => :update
  validates_presence_of :email
  validates_presence_of :card_token

  def update_qty
    self.order.order_items.each do |oi|
      oi.product.quantity = oi.product.quantity - oi.quantity
      oi.product.save!
    end
  end

    def process_payment
    customer = Stripe::Customer.create email: email,
                                       card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: order.total,
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
    update_qty
  end
end
