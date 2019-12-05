class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @posts = Post.all.order(created_at: "desc")
    @post = Post.new
    post_ids = Like.group(:post_id).order('count_post_id DESC').limit(5).count(:post_id).keys
    @ranking = post_ids.map { |id| Post.find(id) }
  end

  def new
    @post = Post.new
  end

  def search
    @posts = Post.joins(:tags).where('title LIKE(?) OR text LIKE(?) OR tag LIKE(?)', "%#{params[:keyword]}%","%#{params[:keyword]}%","%#{params[:keyword]}%").limit(20).order(created_at:"desc")
    
    query = params[:keyword]
    status, next_page, @items = QiitaApiManager.search(query)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).limit(15).order(created_at: "desc")
  end

  def create
    @post = current_user.posts.build(post_params)
    category_list = params[:category_list].split(",")
    if @post.save
      @post.save_categories(category_list)
      redirect_to root_path
    else
      render 'posts/new'
    end
  end

  # def create
  #   @post = Post.new(post_params)
  #   @post.user_id = current_user.id
  #   if @post.save
  #     redirect_back(fallback_location: root_path)
  #   else
  #     redirect_back(fallback_location: root_path)
  #   end
  # end

  private
  def post_params
    params.require(:post).permit(:text, :code, :image, :title, :github_url, :category_list)    # ストロングパラメーターを設定している場合、必要なカラムの情報を必ずpermitに追加する
  end
end
