class CommentsController < ApplicationController

  def show
    @comments = Comment.where(post_id: comment_params[:post_id])
    

  end

  def create
    @comment = Comment.create(text: comment_params[:text], post_id: comment_params[:post_id], user_id: current_user.id)
    if @comment.save
       redirect_to "/posts/#{@comment.post.id}"   #コメントと結びつく投稿詳細画面に遷移する
    else
      #  @comments = @post.comments.includes(:user)
      #  flash.now[:alert] = 'メッセージを入力してください。'
      #  render "/posts/#{@comment.post.id}"
    end
  end

  private
  def comment_params
    params.permit(:text, :post_id)
  end
end
