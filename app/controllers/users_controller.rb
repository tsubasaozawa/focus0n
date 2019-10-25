class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @like_posts = @user.liked_posts.pluck(:user_id).uniq
    @users = User.find(@like_posts)
    @like_users = @users.map { |h| h[:id] }
    @like_user = @like_users.reject { |n| n == current_user.id }

    @posts = @user.liked_posts.map { |h| h[:user_id] }
    @post = @posts.reject { |n| n == current_user.id }
  end

  def edit
    
  end
  def liked
    @user = User.find(params[:id])
    @posts = @user.liked_posts.pluck(:user_id).uniq
    @users = User.find(@posts)
  end
end
