class Admin::ArtworksController < AdminController

  def index
    @artworks = Artwork.all
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
    @artwork = @user.artworks.build(params[:artwork])
    if @artwork.save
      flash[:notice] = "New artwork created!"
      redirect_to admin_user_path(@user)
    else
        render action: "new"
    end 
  end


  def update
    @artwork = Artwork.find(params[:id])

    respond_to do |format|
      if @artwork.update_attributes(params[:artwork])
        format.html { redirect_to @artwork, notice: 'Artwork was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Artwork.find(params[:id]).destroy
    flash[:notice] = "Artwork destroyed!"
    redirect_to admin_artworks_path
  end
end
