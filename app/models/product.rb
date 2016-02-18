class Product < ActiveRecord::Base

  has_many :charges
  has_one :image, dependent: :destroy
  validates :name, :description, :presence => true, :length => { :minimum => 2 }
  validates :price, :quantity, :presence => true, numericality: { only_integer: true }
end
