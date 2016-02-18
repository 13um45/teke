class ChargesController < ApplicationController

  def new
    @charge = Charge.new
    @product = @charge.product
  end

  def create
    @charge = Charge.new charge_params.
      merge(email: stripe_params["stripeEmail"],
        card_token: stripe_params["stripeToken"])
    raise "Please, check charge errors" unless @charge.valid?
    @charge.process_payment
    @charge.save
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
        params.require(:charge).permit(:product_id)
  end
end
