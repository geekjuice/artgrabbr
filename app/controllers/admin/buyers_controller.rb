class Admin::BuyersController < AdminController
  def index
    @buyers = Buyer.all
  end

  def show
    @buyer = Buyer.find(params[:id])
  end

  def new
    @buyer = Buyer.new
  end

  def edit
    @buyer = Buyer.find(params[:id])
  end

  def create
    @buyer = Buyer.new(params[:user])
    if @buyer.save
      # BuyerMailer.registration_confirmation(@buyer).deliver
      flash[:success] = 'Buyer was successfully created.' 
      redirect_to admin_buyer_path(@buyer)
    else
      render 'new'
    end
  end

  def update
    @buyer = Buyer.find(params[:id])
    if @buyer.update_attributes(params[:user])
      # BuyerMailer.registration_confirmation(@buyer).deliver
      flash[:success]= 'Buyer was successfully updated.'
      redirect_to [:admin, @buyer]
    else
      render action: "edit"
    end
  end

  def destroy
    Buyer.find(params[:id]).destroy
    flash[:notice] = "Buyer destroyed!"
    redirect_to admin_buyers_path
  end

  def remove_avatar
    @buyer = Buyer.find(params[:id])
    @buyer.remove_avatar! if @buyer.avatar
    flash[:notice] = 'Profile image removed.'
    redirect_to [:admin, @buyer]
  end
  
end
