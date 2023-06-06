class Admin::OrdersController < ApplicationController

def show
  @order = Order.find(params[:id])

end

 private

def order_params
   params.require(:oder).permit(:customer_id, :payment_amount, :shipping_address, :postal_code, :name, :postage, :payment_method,)
end

end
