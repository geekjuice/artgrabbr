class BuyersController < ApplicationController
  before_filter :signed_in_buyer, only: [:show, :edit, :update]
  before_filter :correct_buyer,   only: [:show, :edit, :update]

  def new
    @buyer = Buyer.new
    if signed_in?
      store_previous
      flash[:alert] = "Already signed in. Please sign out first"
      redirect_back_or current_buyer
    end
  end

  def edit
    @buyer = Buyer.find(params[:id])
  end

  def create
    @buyer = Buyer.new(params[:buyer])
    if @buyer.save
      sign_in(@buyer, 0)
      UserMailer.registration_confirmation(@buyer).deliver
      flash[:success] = 'Welcome to ArtGrabbr, ' + @buyer.name + '!'
      redirect_to artworks_path(shuffle: 1)
    else
      render 'new'
    end
  end

  def update
    @buyer = Buyer.find(params[:id])
    if @buyer.update_attributes(params[:buyer])
      # UserMailer.registration_confirmation(@user).deliver
      flash[:success]= 'Buyer account was successfully updated.'
      redirect_back_or artworks_path(shuffle: 1) #CHANGE TO GO BACK TO LAST PAGE
    else
      render action: "edit"
    end
  end

  def show
    store_location
    @orders = current_buyer.orders.all
  end

  def destroy
    store_previous
    Buyer.find(params[:id]).destroy
    flash[:notice] = "Buyer destroyed!"
    redirect_to artworks_path(shuffle: 1) #CHANGE TO GO BACK TO LAST PAGE
  end

  def resend_validation
    @buyer = current_buyer
    UserMailer.account_reverification(@buyer).deliver
    flash[:notice] = 'Sent a new verification email, ' + @buyer.name + '!'
    redirect_back_or artworks_path(shuffle: 1) #CHANGE TO GO BACK TO LAST PAGE
  end

  def validate
    @buyer = Buyer.find(params[:id])
    code = params[:confirmationcode]
    if !@buyer.validated? & (@buyer.validation_code == code)
      @buyer.toggle!(:validated)
      sign_in(@buyer, 0)
      flash[:success] = 'Thanks for verifying your email, ' + @buyer.first_name + '!'
      redirect_to artworks_path(shuffle: 1)
    elsif @buyer.validated?
      flash[:notice] = 'Your account is already verified, '+ @buyer.first_name + '.'
      redirect_to artworks_path(shuffle: 1)
    else
      flash[:notice] = "Something doesn't seem right, "+ @buyer.first_name + '...'
      redirect_to artworks_path(shuffle: 1)
    end
  end


  private

    def signed_in_buyer
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end

    def correct_buyer
      @buyer = Buyer.find(params[:id])
      redirect_to artworks_path(shuffle: 1) unless current_buyer?(@buyer)
    end
end
