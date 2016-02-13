class ProductsController < ApplicationController

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


  end

  def show
    @product = Product.find(params[:id])
    @images = @product.image
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to new_image_path(product_id: @product.id)
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity)
  end

end
