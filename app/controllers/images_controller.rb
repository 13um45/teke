class ImagesController < ApplicationController
    def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new(:product_id => params[:product_id])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(image_params)
    @product = Product.find(@image.product_id)

    if @image.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    @image = Image.find(params[:id])

    if @image.update(image_params)
      redirect_to @image
    else
      render 'edit'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to products_path
  end

private
  def image_params
    params.require(:image).permit(:image1, :image2, :image3, :image4, :product_id)
  end

end
