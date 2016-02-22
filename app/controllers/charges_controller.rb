class ChargesController < ApplicationController
before_action :require_logged_in, only: [:index, :show]
  def index
    @charges = Charge.order(:created_at).reverse
  end

  def show
    @charge = Charge.find(params[:id])
    @order = @charge.order
    @order_items = @order.order_items
  end

  def new
   redirect_to root_path
  end

  def create
    @charge = Charge.new charge_params.
      merge(email: stripe_params["stripeEmail"],
        card_token: stripe_params["stripeToken"])
    raise "Please, check charge errors" unless @charge.valid?
    @charge.process_payment
    @charge.save
    session[:order_id] = nil
    redirect_to products_path, notice: 'Registration was successfully created.'
  rescue Stripe::CardError => e
    flash[:error] = e.message
    render :new
  end

private

  def stripe_params
      params.permit :stripeEmail, :stripeToken
  end

  def charge_params
        params.require(:charge).permit(:order_id)
  end
end
