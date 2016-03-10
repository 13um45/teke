class Product < ActiveRecord::Base

  has_many :order_items
  has_one :image, dependent: :destroy
  validates :name, :description, :length => { :minimum => 2 }
  validates :price, :quantity, numericality: { only_integer: true }

  default_scope { where(active: true) }

  scope :rings, -> { where(ring: true) }
  scope :earrings, -> { where(earring: true) }
  scope :necklaces, -> { where(necklace: true) }
  scope :bracelets, -> { where(bracelet: true) }
  scope :sold_out, -> { where(active: false) }
  scope :active, -> {where("quantity >= ?", 1)}

  def sold_out
    self.quantity < 1
  end


  def formatted_price
    price_in_dollars = price.to_f / 100
    format("%.2f", price_in_dollars)
  end
end
