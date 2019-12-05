class LikesController < ApplicationController
  before_action :set_variables

  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    render 'create-like.js.erb'
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    render 'delete-like.js.erb'
  end

  def set_variables
    @post = Post.find(params[:post_id])
    @id_name = "#like-btn-#{@post.id}"
  end
end
