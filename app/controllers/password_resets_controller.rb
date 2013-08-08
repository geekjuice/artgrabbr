class PasswordResetsController < ApplicationController
  def new
  end

  def create
  	buyer = Buyer.find_by_email(params[:email])
  	if !buyer.nil?
		buyer.send_password_reset
		redirect_back_or root_url
		flash[:success] = "Email sent with password reset instructions."
	else
		flash[:alert] = "No registered user with email [ "+ params[:email] + " ]..."
		render 'new'
	end
  end

  def edit
  	@buyer = Buyer.find_by_password_reset_token!(params[:id])
  	if @buyer.password_reset_sent_at < 2.hours.ago
  		redirect_to new_password_reset_path
  		flash[:alert] = "Password reset has expired."
  	end
  end

  def update
  	@buyer = Buyer.find_by_password_reset_token!(params[:id])
  	if @buyer.password_reset_sent_at < 2.hours.ago
  		redirect_to new_password_reset_path
  		flash[:alert] = "Password reset has expired."
  	elsif @buyer.update_attributes(params[:buyer])
  		sign_in(@buyer, 0)
  		redirect_to root_url
  		flash[:success] = "Password has been reset!"
  	else
  		render :edit
  	end
  end

end
