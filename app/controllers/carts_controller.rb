class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    @charge = current_order.charges.new
  end
end
