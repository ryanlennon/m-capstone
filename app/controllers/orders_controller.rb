class OrdersController < ApplicationController

  def create
    @Order = Order.create(
      quantity: params[:quantity],
      product_id: params[:product_id],
      
      user_id: 1 #change this with devise later
      )

    
    @quantity = Order.last.quantity
    render :index


  end

  def new
  end

end
