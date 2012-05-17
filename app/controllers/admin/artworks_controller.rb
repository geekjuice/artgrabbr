class Admin::ArtworksController < AdminController

# Clean up routes and secure them

  def index
    @artworks = Artwork.find_all_by_user_id(params[:id])
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def new
    @artwork = Artwork.new
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end

  def create
    @user = User.find(params[:id])
    @artwork = @user.artworks.build(params[:artwork], user: @user)
    if @artwork.save
      flash[:notice] = "New artwork created!"
      redirect_to [:admin, @user]
    else
        render action: "new"
    end 
  end


  def update
    @artwork = Artwork.find(params[:id])
    @user = @artwork.user
    if @artwork.update_attributes(params[:artwork])
      flash[:notice] = @user.first_name + %{'s artwork updated!}
      redirect_to [:admin, @user]
    else
      render action: "edit"
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    @user = @artwork.user
    @artwork.destroy
    flash[:notice] = "Artwork destroyed!"
    redirect_to [:admin, @user]
  end
end
