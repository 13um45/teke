class ProductsController < ApplicationController

  before_action :require_logged_in, except: [:index, :show, :rings,
    :earrings, :necklaces, :bracelets]

  def index
    @products = Product.all
    #sorting by price
    #low-high
    @p_low_high = Product.order(:price)
    #high-low
    @p_hig_low = @p_low_high.reverse
    #sorting by name
    #a-z
    @p_name = Product.order(:name)
    #z-a
    @p_name_desc = @p_name.reverse
    #sorting by newest
    @p_newest = Product.order(:created_at).reverse

    @order_item = current_order.order_items.new
  end

  def rings
    @rings  = Product.rings
  end

  def earrings
    @earrings  = Product.earrings
  end

  def necklaces
    @necklaces  = Product.necklaces
  end

  def bracelets
    @bracelets  = Product.bracelets
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.image
    @order_item = current_order.order_items.new
  end

  def new
    @product = current_user.products.new
  end

  def edit
    @product = current_user.products.find(params[:id])
  end

  def create
    @product = current_user.products.new(product_params)

    if @product.save
      redirect_to new_image_path(product_id: @product.id)
    else
      render 'new'
    end
  end

  def update
    @product = current_user.products.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy

    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :active,
      :ring, :earring, :necklace, :bracelet)
  end
end
