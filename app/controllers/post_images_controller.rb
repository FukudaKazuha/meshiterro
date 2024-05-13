class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
    # @post_image には form_with に渡すための「空のモデル」を用意したい
  end
  
  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
    redirect_to post_images_path
    # リダイレクト先はindex投稿一覧
    else
      render:new
    end
  end

  def index
    @post_images = PostImage.page(params[:page])
    # @post_images = PostImage.all(postimagesテーブル内の全データ取得)
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end
  
   # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
