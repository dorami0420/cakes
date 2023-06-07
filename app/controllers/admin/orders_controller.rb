class Admin::OrdersController < ApplicationController

def show
  @order = Order.find(params[:id])
  @order_d = @order.order_details
@sum = 0
end

def with_tax_price
    (price * 1.1).floor
end

 private

def order_params
   params.require(:oder).permit(:customer_id, :payment_amount, :shipping_address, :postal_code, :name, :postage, :payment_method,)
end

end
