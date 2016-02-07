class Product < ActiveRecord::Base
  validates :name, :description, :presence => true, :length => { :minimum => 2 }
  validates :price, :quantity, :presence => true, numericality: { only_integer: true }
end
