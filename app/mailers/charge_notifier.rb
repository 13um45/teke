class ChargeNotifier < ApplicationMailer
  default :from => 'christian@leumas.co'

  def send_order_email(charge)
    @charge = charge
    @order = @charge.order
    @order_items = @order.order_items
    mail( :to => @charge.email,
    :subject => 'Your Order' )
  end

   def send_tracking_email(charge)
    @charge = charge
    @order = @charge.order
    @order_items = @order.order_items
    mail( :to => @charge.email,
    :subject => 'Tracking Information For Your Order' )
  end
end
