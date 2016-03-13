class ProductsController < ApplicationController

  before_action :require_logged_in, except: [:index, :show, :rings,
    :earrings, :necklaces, :bracelets, :low_high]

  def index
    @products = Product.active
    #high-low
    # @p_high_low = @p_low_high.reverse
    #sorting by name
    #a-z
    @p_name = Product.order(:name)
    #z-a
    @p_name_desc = @p_name.reverse
    #sorting by newest
    @p_newest = Product.order(:created_at).reverse

    @order_item = current_order.order_items.new
  end

  def low_high
    @p_low_high = Product.active.order(:price)

    respond_to do |format|
      format.html # show_rec_horses.html.erb
      format.js   # show_rec_horses.js.erb
    end
  end

  def rings
    @rings  = Product.rings.active

    respond_to do |format|
      format.html # show_rec_horses.html.erb
      format.js   # show_rec_horses.js.erb
    end
  end

  def earrings
    @earrings  = Product.earrings.active

    respond_to do |format|
      format.html # show_rec_horses.html.erb
      format.js   # show_rec_horses.js.erb
    end
  end

  def necklaces
    @necklaces  = Product.necklaces.active

    respond_to do |format|
      format.html # show_rec_horses.html.erb
      format.js   # show_rec_horses.js.erb
    end
  end

  def bracelets
    @bracelets  = Product.bracelets.active

    respond_to do |format|
      format.html # show_rec_horses.html.erb
      format.js   # show_rec_horses.js.erb
    end
  end

  def show
    @product = Product.find(params[:id])
    @earrings = Product.earrings
    @necklaces = Product.necklaces
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
