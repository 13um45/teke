class Order < ActiveRecord::Base
  belongs_to :order_status
  has_many :order_items
  has_many :charges
  before_create :set_order_status
  before_save :update_subtotal
  before_save :add_tax
  before_save :add_shipping
  before_save :add_total


  def formatted_subtotal
    price_in_dollars = subtotal.to_f / 100
    format("%.2f", price_in_dollars)
  end

  def formatted_tax
    price_in_dollars = tax.to_f / 100
    format("%.2f", price_in_dollars)
  end

   def formatted_total
    price_in_dollars = total.to_f / 100
    format("%.2f", price_in_dollars)
  end

   def formatted_shipping
    price_in_dollars = shipping.to_f / 100
    format("%.2f", price_in_dollars)
  end

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
private
  def set_order_status
    self.order_status_id = 1
  end

  def add_total
    self[:total] = tax + shipping + subtotal
  end

  def add_tax
    self[:tax] = subtotal * 6 / 100
  end

  def add_shipping
    self[:shipping] = 680
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
