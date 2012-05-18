class Admin::OrdersController < AdminController

  def index
  end

  def show
    @order = Order.find_by_artwork_id(params[:id])
  end

  def new
    @artwork = Artwork.find(params[:artwork_id])
    @order = Order.new
    @order.artwork_id = @artwork.id
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @artwork = Artwork.find(params[:order][:artwork_id])
    @order = @artwork.build_order(params[:order], artwork: @artwork)
    if @order.save
      @artwork.toggle!(:sold)
      flash[:notice] = "Order created! " + @artwork.sold.to_s
      redirect_to [:admin, @artwork]
    else
      render action: "new"
    end
  end


  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
