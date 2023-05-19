class Admin::ItemsController < ApplicationController
  
  
  def new
    @post_image = PostImage.new
  end
  
  
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.save
    redirect_to admin_items_path
  end
  def index
  end

  def show
  end
  
  
  private

  def post_image_params
    params.require(:post_image).permit(:name, :image, :introduction, :price)
  end
  
  
  
  
end
