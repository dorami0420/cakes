class Admin::PostImagesController < ApplicationController
  def index
     @post_images = PostImage.page(params[:page])
  end
  
  def show
    @post_image = PostImage.find(params[:id])
  
  end
  
  def create
    @post_image = PostImage.new(post_image_params)
  if @post_image.save
    redirect_to admin_items_path
  else
      render :new
  end
  
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to  post_images_path
  end


 private

  def post_image_params
    params.require(:post_image).permit(:name, :image, :introduction, :price)
  end
  
end
