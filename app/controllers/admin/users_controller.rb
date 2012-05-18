class Admin::UsersController < AdminController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = 'User was successfully created.' 
      redirect_to admin_user_path(@user)
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success]= 'User was successfully updated.'
      redirect_to [:admin, @user]
    else
      render action: "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User destroyed!"
    redirect_to admin_users_path
  end
end
