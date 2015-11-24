class ProductsController < ApplicationController
  def index
    @product = Product.all

    sort_attribute = params[:sort_attribute]
    sort_order = params[:sort_order]
    if sort_attribute && sort_order
      @product = Product.order(sort_attribute => sort_order)
    end

    if params[:discount]
      @product = Product.where("price < ?", 2)
    end
  end

  def new
  end

  def create
        @product = Product.create(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description]
      #user_id: current_user.id
      )
    flash[:success] = "You have successfully added a product!"
    redirect_to '/products'
  end

  def show
    if params[:id] =="random"
      products = Product.all
      @product = product.sample
    else
    @product = Product.find_by(id: params[:id])
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    product.update(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description],
      )
    flash[:success] = "Information succesfully updated!"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:success] = "Product successfully deleted!"
    redirect_to '/products'
  end

end
