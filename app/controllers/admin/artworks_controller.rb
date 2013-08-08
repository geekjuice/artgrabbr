class Admin::ArtworksController < AdminController

# Clean up routes and secure them

  def index
    @artworks = Artwork.all;
  end

  def show
    @artwork = Artwork.find(params[:id])
    if ArtworkImage.find_all_by_artwork_id(@artwork.id)
      @artworkimage = ArtworkImage.find_all_by_artwork_id(@artwork.id)
    end
    # if @artwork.order.nil? && @artwork.sold
    #   @artwork.toggle!(:sold)
    # end
  end

  def new
    @user = User.find(params[:user_id])
    @artwork = Artwork.new
    @artwork.user_id = @user.id
  end

  def edit
    @artwork = Artwork.find(params[:artwork_id])
  end

  def create
    @user = User.find(params[:artwork][:user_id])
    @artwork = @user.artworks.build(params[:artwork], user: @user)
    if @artwork.save
      @artwork
      flash[:success] = "New artwork created!"
      redirect_to [:admin, @artwork]
    else
        render action: "new"
    end 
  end


  def update
    @artwork = Artwork.find(params[:id])
    @user = @artwork.user
    if @artwork.update_attributes(params[:artwork])
      flash[:success] = @user.name + %{'s artwork updated!}
      redirect_to [:admin, @artwork]
    else
      render action: "edit"
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    @user = @artwork.user
    @artwork.destroy
    Order.find_all_by_artwork_id(@artwork.id).each do |oldorder|
      oldorder.destroy
    end
    flash[:notice] = "Artwork destroyed!"
    redirect_to [:admin, @user]
  end
end
