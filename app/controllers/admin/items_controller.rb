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
  
  def edit
      @items = Items.find(params[:id])
      
  end
  
  def update
      @amin = admin
  if @admin.update(item_params)
    flash[:notice] = "You have updated user successfully."
      redirect_to  admin_items_path
  else
      render :edit
  end
  end
  
  private

  def item_params
    params.require(:user).permit(:name, :image, :introduction, :price)
  end
  
  
  
  
end
