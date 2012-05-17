class Admin::OrdersController < AdminController

  def index
  end

  def show
    @order = Order.find_by_artwork_id(params[:id])
  end

  def new
    @artwork = Artwork.find(params[:id])
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @artwork = Artwork.find(params[:id])
    @order = @artwork.order.build(params[:order], artwork: @artwork)
    @order.artwork_id = @artwork_id
    # @order = Order.new(params[:order])
    if @order.save
      flash[:notice] = "Order created!"
      redirect_to [:admin, @artwork]
    else
      render action: "new"
    end
    # flash[:notice] = @artwork.title
    # redirect_to [:admin, @user]
  end

  # PUT /orders/1
  # PUT /orders/1.json
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

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
