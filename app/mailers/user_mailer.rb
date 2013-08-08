class UserMailer < ActionMailer::Base
	default :from => "Artgrabbr Team <hello@artgrabbr.com>"

	def registration_confirmation(buyer)
		@buyer = buyer
		mail(	:to => "#{@buyer.name} <#{@buyer.email}>",
				:subject => "Welcome to Artgrabbr!",
				:content_type => 'text/html')
	end

	def password_reset(buyer)
	  @buyer = buyer
	  mail(	:to => "#{@buyer.name} <#{@buyer.email}>",
				:subject => "Artgrabbr - Password Reset",
				:content_type => 'text/html')
	end

	def account_reverification(buyer)
		@buyer = buyer
		mail(	:to => "#{@buyer.name} <#{@buyer.email}>",
				:subject => "Artgrabbr - Re-Verification Email!",
				:content_type => 'text/html')
	end

	def inquiry_confirmation(artwork, order)
		@order = order
		@artwork = artwork
		@image = @artwork.artwork_images.find_by_showcaseimage(true)
		mail(	:to => "#{@artwork.user.name} <#{@artwork.user.email}>",
				:subject => "Artgrabbr - #{@order.name} wants to buy '#{@artwork.title}'!",
				:content_type => 'text/html')
	end

	def inquiry_cancellation(artwork, order)
		@order = order
		@artwork = artwork
		@image = @artwork.artwork_images.find_by_showcaseimage(true)
		mail(	:to => "#{@artwork.user.name} <#{@artwork.user.email}>",
				:subject => "Artgrabbr - #{@order.name} wants to cancel order for '#{@artwork.title}' :(",
				:content_type => 'text/html')
	end

	def acceptance_email(order, buyer, message)
		@order = order
		@buyer = buyer
		@message = message
		mail(	:to => "#{@buyer.name} <#{@buyer.email}>",
				:subject => "Artgrabbr - #{@order.artwork.user.name} accepted your artGrab request for '#{@order.artwork.title}'",
				:content_type => 'text/html')
	end


end
