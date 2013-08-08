class Admin::ArtworkImagesController < ApplicationController
	
	def new
		@artwork = Artwork.find(params[:artwork_id])
		@artwork_image = ArtworkImage.new
		@artwork_image.artwork_id = @artwork.id
	end

	def create
		@artwork = Artwork.find(params[:artwork_image][:artwork_id])
		if !params[:artwork_image][:remote_image_url].blank?
			url = params[:artwork_image][:remote_image_url]
			if url[0..6].downcase != 'http://'
				params[:artwork_image][:remote_image_url] = 'http://' + url
			end
		end
		@artwork_image = ArtworkImage.new(params[:artwork_image])
		if @artwork_image.save
	      flash[:success] = "Artwork image added!"
	      if @artwork.artwork_images.count == 1
	      	@artwork_image.toggle!(:showcaseimage)
	      end
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
    @artwork_image.remove_image! if @artwork_image
    @artwork_image.destroy
    flash[:notice] = "Artwork image deleted!"
    redirect_to [:admin, @artwork]
  end

  def togglemain
    showcase = ArtworkImage.find(params[:imageid])
    current = ArtworkImage.find_by_artwork_id_and_showcaseimage(showcase.artwork.id, true)
    if current
	    current.toggle!(:showcaseimage)
	end
    showcase.toggle!(:showcaseimage)
    redirect_to admin_artwork_path(showcase.artwork)
	end
end
