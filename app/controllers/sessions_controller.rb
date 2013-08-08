class SessionsController < ApplicationController
	def new
		if current_buyer
			redirect_back_or root_path
		end
	end

	def create
		buyer = Buyer.find_by_email(params[:session][:email])
		if !defined?(params[:remember_me])
			remember_me = 0;
		else
			remember_me = params[:remember_me]
		end
	    if buyer && buyer.authenticate(params[:session][:password])
	      sign_in(buyer, remember_me)
	      if current_buyer.validated?
		    	flash[:success] = 'Welcome back, ' + current_buyer.name + '!'
		  else
		  		flash[:notice] = 'Hey ' + current_buyer.name + ', please validate your account to begin grabbing art. Thanks!'
		  end

	      redirect_back_or artworks_path(shuffle: 1)
	    else
	      flash[:error] = 'Invalid email/password combination'
	      render 'new'
	    end
	end

	def destroy
		sign_out
	    redirect_to artworks_path
	end
end
