class MicropostsController < ApplicationController
  before_action :correct_user,   only: :destroy
  
  def new
    @micropost = Micropost.new
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      redirect_to root_url
      flash[:notice]= '投稿しました!'
    else
      @feed_items = current_user.feed
      render 'microposts/new'
    end
  end
  
  def index
    @micropost  = current_user.microposts.build
    @feed_items = current_user.feed
    @microposts = @feed_items.all
    @user = @micropost.user
    @comment = Comment.new
  end
  
  def show
    @micropost = Micropost.find(params[:id])
    @user = @micropost.user #投稿した
    @comment = Comment.new
    @comments = @micropost.comments.includes(:user)
  end
  
  def destroy
    @micropost.destroy
    redirect_to request.referrer || root_url
    flash[:notice]='投稿を削除しました'
  end
  
  private
    def micropost_params
      params.require(:micropost).permit(:content, :image) # micropostモデルのcontentカラム/imageカラムを許可
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
