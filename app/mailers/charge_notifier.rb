class ChargeNotifier < ApplicationMailer
  default :from => 'christian@leumas.co'

  def send_order_email(charge)
    @charge = charge
    @order = @charge.order
    @order_items = @order.order_items
    mail( :to => @charge.email,
    :subject => 'Thanks for your purchase!' )
  end
end
