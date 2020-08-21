class CommentsController < ApplicationController
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      @micropost.create_notification_comment!(current_user, @comment.id)
      flash[:notice]= "コメントしました！"
      redirect_to micropost_path(@micropost)
    else
      render 'microposts/show'
    end
  end
  
  def destroy
    @comment = Coment.find(params[:id])
    @comment.destroy
    redirect_to root_path
    flash[:notice]= 'コメントを削除しました'
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:text)
  end
end
