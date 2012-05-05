class UsersController < ApplicationController
  def index
  end

  def show

    @user = User.find params[:id]

    @artworks = User.artworks
  end

  
end
