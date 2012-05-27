class Admin::OrdersController < AdminController

  def index
    @orders = Order.all;
  end

  def show
    @order = Order.find(params[:id])
    @artwork = @order.artwork
  end

  def new
    @artwork = Artwork.find(params[:artwork_id])
    @order = Order.new
    @order.artwork_id = @artwork.id
  end

  def edit
    @order = Order.find(params[:id])
    @artwork = @order.artwork
  end

  def create
    @artwork = Artwork.find(params[:order][:artwork_id])
    @order = Order.new(params[:order])
    if @order.save_with_payment
      @artwork.toggle!(:sold)
      flash[:notice] = "Order created!"
      redirect_to [:admin, @artwork]
    else
      render action: "new"
    end
  end


  def update
    @order = Order.find(params[:id])
    @artwork = @order.artwork
   if @order.update_attributes(params[:order])
      flash[:success] = @artwork.title + %{'s order has been updated!}
      redirect_to [:admin, @artwork]
    else
      render action: "edit"
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @artwork = @order.artwork
    @order.destroy
    if @artwork.sold? 
      @artwork.toggle!(:sold)
    end
    flash[:notice] = "Order cancelled!"
    redirect_to [:admin, @artwork]
  end

end
