class Admin::ArtworkImagesController < ApplicationController

	def new
		@artwork = Artwork.find(params[:artwork_id])
		@artwork_image = ArtworkImage.new
		@artwork_image.artwork_id = @artwork.id
	end

	def create
		@artwork = Artwork.find(params[:artwork_image][:artwork_id])
		# @artwork_image = @artwork.artwork_images.build(params[:artwork_image])
		@artwork_image = ArtworkImage.new(params[:artwork_image])
		if @artwork_image.save
	      flash[:success] = "Artwork image added!"
	      redirect_to [:admin, @artwork]
	    else
	        render action: "new"
	    end 
	end

	def edit
		@artwork_image = ArtworkImage.find(params[:id])
		@artwork = @artwork_image.artwork
	end

	def update
    @artwork_image = ArtworkImage.find(params[:id])
    @artwork = @artwork_image.artwork
   if @artwork_image.update_attributes(params[:artwork_image])
      flash[:success] = "Artwork Image updated!"
      redirect_to [:admin, @artwork]
    else
      render action: "edit"
    end
  end

  def destroy
    @artwork_image = ArtworkImage.find(params[:id])
    @artwork = @artwork_image.artwork
    @artwork_image.destroy
    flash[:notice] = "Artwork image deleted!"
    redirect_to [:admin, @artwork]
  end
end
