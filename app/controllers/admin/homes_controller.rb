class Admin::HomesController < ApplicationController
  layout 'admin'
   before_action :authenticate_admin!

  def top
    @orders = Order.all
  end



end