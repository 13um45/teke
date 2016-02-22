class Product < ActiveRecord::Base

  has_many :order_items
  has_one :image, dependent: :destroy
  validates :name, :description, :length => { :minimum => 2 }
  validates :price, :quantity, numericality: { only_integer: true }

  default_scope { where(active: true) }
end
