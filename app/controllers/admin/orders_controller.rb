class Admin::OrdersController < AdminController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      artworkid=[]
      @user.artworks.each_with_index do |x,i|
        artworkid[i] = x.id
      end
      @orders = Order.find_all_by_artwork_id(artworkid)
    else
      @orders = Order.all
    end
  end

  def show
    @order = Order.find(params[:id])
    @artwork = @order.artwork
  end

  def acceptEmail
    order = Order.find(params[:orderid])
    buyer= order.buyer
    message = params[:messageToBuyer]
    UserMailer.acceptance_email(order, buyer, message).deliver
    flash[:success] = 'Acceptance email sent!' 
    redirect_to [:admin, order.artwork.user]
  end

  # def new
  #   @artwork = Artwork.find(params[:artwork_id])
  #   @order = Order.new
  #   @order.artwork_id = @artwork.id
  # end

  # def edit
  #   @order = Order.find(params[:id])
  #   @artwork = @order.artwork
  # end

  # def create
  #   @artwork = Artwork.find(params[:order][:artwork_id])
  #   @order = Order.new(params[:order])
  #   # if @order.save_with_payment
  #   #   @artwork.toggle!(:sold)
  #   #   flash[:notice] = "Order created!"
  #   #   redirect_to [:admin, @artwork]
  #   # else
  #   #   render action: "new"
  #   # end
  # end


  # def update
  #   @order = Order.find(params[:id])
  #   @artwork = @order.artwork
  #  if @order.update_attributes(params[:order])
  #     flash[:success] = @artwork.title + %{'s order has been updated!}
  #     redirect_to [:admin, @artwork]
  #   else
  #     render action: "edit"
  #   end
  # end

  # def destroy
  #   @order = Order.find(params[:id])
  #   @artwork = @order.artwork
  #   @order.destroy
  #   if @artwork.sold? 
  #     @artwork.toggle!(:sold)
  #   end
  #   flash[:notice] = "Order cancelled!"
  #   redirect_to [:admin, @artwork]
  # end

end
