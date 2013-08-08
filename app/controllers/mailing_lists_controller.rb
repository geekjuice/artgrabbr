class MailingListsController < ApplicationController
	def new
	end

	def create
		mailinglist = MailingList.new(params[:mailinglist])
		if mailinglist.save!
			flash[:success] = "Thanks, we'll let you know when we go live!"
			redirect_back_or root_path
		else
			flash[:notice] = "Uh oh... something went wrong..."
			redirect_back_or root_path
		end
	end
end
