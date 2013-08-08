class OrdersController < ApplicationController
  before_filter :correct_order_buyer, only: [:destroy]

  def new
  end

  def create
    @artwork = Artwork.find(params[:order][:artwork_id])
    @order = Order.new(params[:order])
    @order.status = "Pending"
    if @order.save!
      # UserMailer.inquiry_confirmation(@artwork, @order).deliver
      flash[:success] = "Order created!"
      redirect_back_or @artwork
    else
      redirect_back_or @artwork
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @artwork = @order.artwork
    # UserMailer.inquiry_cancellation(@artwork, @order).deliver
    @order.destroy
    flash[:notice] = "Order cancelled!"
    redirect_back_or @artwork
  end

end
