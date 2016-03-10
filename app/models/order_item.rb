class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true,
    :greater_than => 0, :less_than_or_equal_to => :product_qty }
  validate :product_present
  validate :order_present
  before_create :uniq_product
  before_save :finalize

  def product_qty
    product.quantity
  end

  def formatted_unit_price
    price_in_dollars = unit_price.to_f / 100
    format("%.2f", price_in_dollars)
  end

  def formatted_total_price
    price_in_dollars = total_price.to_f / 100
    format("%.2f", price_in_dollars)
  end

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def uniq_product
     oi = order.order_items.where("(product_id) = ?", self.product_id).first
    if oi
      self.quantity = oi.quantity + self.quantity
        if self.quantity > product_qty
           self.quantity = product_qty
        else
        end
      oi.destroy!
    else
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end

end
