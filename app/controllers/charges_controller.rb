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
    @charge = Charge.new charge_params
    raise "Please, check charge errors" unless @charge.valid?
    @charge.process_payment
    @charge.save
    session[:order_id] = nil
    redirect_to products_path, notice: 'Order was successfully placed.'
  rescue Stripe::CardError => e
    flash[:error] = e.message
    render :new
  end

  def update
    @charge = Charge.find(params[:id])

    if @charge.update(charge_params)
      redirect_to @charge, notice: 'Tracking number was added.'
    else
      redirect_to @charge, notice: 'Tracking number was not added.'
    end
  end

private

  def stripe_params
      params.permit :stripeEmail, :stripeToken
  end

  def charge_params
        params.require(:charge).permit(:order_id, :tracking, :email, :card_token)
  end
end
