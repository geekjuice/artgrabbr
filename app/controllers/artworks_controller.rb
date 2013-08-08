class ArtworksController < ApplicationController
  before_filter :correct_art_buyer, only: [:sold]


  def index
    store_location 
    artworks = Artwork.all
    if !params[:artist].blank?
      artworks = Artwork.find_all_by_user_id(params[:artist])
    elsif !params[:price].blank?
      artworks = Artwork.find(:all, :order => 'price ' + params[:price], :conditions => {:sold => false})
    elsif !params[:sold].blank?
      artworks = Artwork.find_all_by_sold(params[:sold])
    else
      params[:seed] ||= Random.new_seed
      srand params[:seed].to_i
      artworks = Artwork.all.shuffle
    end
      @artworks = Kaminari.paginate_array(artworks).page(params[:page]).per(8)
  end

  def show
    store_location
    @artwork = Artwork.find(params[:id])
    @user = @artwork.user
    if signed_in?
      @order = Order.new( name: current_buyer.name.to_s, 
                          email: current_buyer.email.to_s,
                          buyer_id: current_buyer.id,
                          artwork_id: @artwork.id)
    else
      @order = Order.new(artwork_id: @artwork.id)
    end

    if ArtworkImage.find_all_by_artwork_id(@artwork.id)
      @artworkimage = ArtworkImage.find_all_by_artwork_id(@artwork.id)
    end
  end

  def sold
    @artwork = Artwork.find(params[:id])
    @artwork.toggle!(:sold)
    redirect_back_or current_buyer
  end

end
