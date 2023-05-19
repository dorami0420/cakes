class Admin::PostImagesController < ApplicationController
  def index
     @post_images = PostImage.page(params[:page])
  end
end
