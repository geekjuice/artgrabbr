module SessionsHelper
	def sign_in(buyer, remember_me)
		if remember_me
			cookies.permanent[:remember_token] = buyer.remember_token
		else
			cookies[:remember_token] = buyer.remember_token
		end
		self.current_buyer = buyer
	end

	def signed_in?
		!current_buyer.nil?
	end

	def current_buyer=(buyer)
		@current_buyer = buyer
	end

	def current_buyer
		@current_buyer ||= Buyer.find_by_remember_token(cookies[:remember_token])
	end

	def current_buyer?(buyer)
 	   buyer == current_buyer
	end

	def current_order(artwork)
		current_buyer.orders.find_by_artwork_id(artwork.id)
	end

	def has_inquiry?(artwork)
		artwork.orders.count > 0
	end

	def inquirycount
		current_buyer.orders.find_all_by_status("Pending").count
	end

	def inquirycount?(buyer)
		buyer.orders.find_all_by_status("Pending").count
	end

	def toomanyinquiries?
		# current_buyer.orders.count >= 5
		# current_buyer.orders.find_all_by_status("Pending").count >= 5
		inquirycount >= 5
	end

	def inquiredalready?(artwork)
		current_buyer.orders.find_by_artwork_id(artwork.id)
	end

	def total_artist_inquiries(userId)
		count = 0
		Artwork.find_all_by_user_id_and_sold(userId,false).each do |artwork|
			count = count + artwork.orders.count
		end
		count
	end

	def ordering_toggle
		if (params[:price].blank? || params[:price] == 'DESC')
			@price_order = 'ASC'
			@price_text = 'Sort: Price (Lowest)'
		else
			@price_order = 'DESC'
			@price_text = 'Sort: Price (Highest)'
		end
		if (params[:sold].blank? || params[:sold] == 'false')
			@sold_order = 'true'
			@sold_text = 'View Sold'
		else
			@sold_order = 'false'
			@sold_text = 'View Available'
		end
	end

	def correct_order_buyer
		order = Order.find(params[:id])
      	artwork = order.artwork
      	current_buyer.orders.find_by_artwork_id(artwork.id)  
    end
    
    def correct_art_buyer
      	artwork = Artwork.find(params[:id])
      	current_buyer.orders.find_by_artwork_id(artwork.id)  
    end
    
	def signed_in_user
	    unless signed_in?
	      store_location
	      redirect_to signin_path, notice: "Please sign in."
	    end
	end
	
	def sign_out
		self.current_buyer = nil
		cookies.delete(:remember_token)
	end

	def redirect_back_or(default)
	    redirect_to(session[:return_to] || default)
	    clear_return_to
	end

	def store_previous
	    session[:return_to] = request.referer
	end
	
	def store_location
		session[:return_to] = request.fullpath
	end

	private
    
      def buyer_from_remember_token
        remember_token = cookies[:remember_token]
        # remember_token = session[:remember_token]
        Buyer.find_by_remember_token(remember_token) unless remember_token.nil?
      end
      
      def clear_return_to
        session.delete(:return_to)
      end
end
