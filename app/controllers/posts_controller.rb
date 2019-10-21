class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @posts = Post.all.order(created_at:"desc")
    @post = Post.new
    post_ids = Like.group(:post_id).order('count_post_id DESC').limit(5).count(:post_id).keys
    @ranking = post_ids.map { |id| Post.find(id) }
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def save_categories(categories)
    current_categories = self.tags.pluck(:tag) unless self.tags.nil?
    old_categories = current_categories - categories
    new_categories = categories - current_categories

    # Destroy old taggings:
    old_categories.each do |old_name|
      self.tags.delete Tags.find_by(tag:old_name)
    end

    # Create new taggings:
    new_categories.each do |new_name|
      post_tag = Tag.find_or_create_by(tag:new_name)
      self.tags << post_tag
    end
  end

  private
  def post_params
    params.require(:post).permit(:text, :code, :image, :title, :github_url)    # ストロングパラメーターを設定している場合、必要なカラムの情報を必ずpermitに追加する
  end
end
