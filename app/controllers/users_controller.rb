class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    
  end
  def liked
    @user = User.find(params[:id])
    @posts = @user.liked_posts.pluck(:user_id).uniq
    @users = User.find(@posts)
  end
end
