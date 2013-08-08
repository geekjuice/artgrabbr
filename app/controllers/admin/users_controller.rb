class Admin::UsersController < AdminController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @artworks = @user.artworks

    artworkid=[]
    @artworks.each_with_index do |x,i|
      artworkid[i] = x.id
    end
  end
  # Sort/Order by order date created

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # UserMailer.registration_confirmation(@user).deliver
      flash[:success] = 'User was successfully created.' 
      redirect_to admin_user_path(@user)
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      # UserMailer.registration_confirmation(@user).deliver
      flash[:success]= 'User was successfully updated.'
      redirect_to [:admin, @user]
    else
      render action: "edit"
    end
  end

  # Create undo accept to reverse accept
  def accept 
    order = Order.find(params[:orderid])
    order.status = "Accepted"
    order.save!
    if order.artwork.sold == false
      order.artwork.toggle!(:sold)
    end
    Order.find_all_by_artwork_id(order.artwork.id).each do |f|
      if f.status != "Accepted"
        f.status = "Declined"
        f.save!
      end
    end
    redirect_to [:admin, User.find(params[:id])]
  end

  def decline
    order = Order.find(params[:orderid])
    order.status = "Declined"
    order.save!
    if order.artwork.sold == true
      order.artwork.toggle!(:sold)
    end
    redirect_to [:admin, User.find(params[:id])]
  end

  def undo
    order = Order.find(params[:orderid])
    order.status = "Pending"
    order.save!
    if order.artwork.sold == true
      order.artwork.toggle!(:sold)
    end
    redirect_to [:admin, User.find(params[:id])]
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User destroyed!"
    redirect_to admin_users_path
  end

  def remove_avatar
    @user = User.find(params[:id])
    @user.remove_avatar! if @user.avatar
    flash[:notice] = 'Profile image removed.'
    redirect_to [:admin, @user]
  end
end
