class Admin::ItemsController < ApplicationController
layout 'admin'

  def new
    @items = Item.new
  end


  def create
    @items = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def index
   @items = Item.all

  end
  def show
  end

  def edit
      @items = Item.find(params[:id])

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
    params.require(:item).permit(:name, :image, :introduction, :price)
  end




end
