class Public::OrdersController < ApplicationController
  
def new
    @order = Order.new
end

def confirm
  @order = Order.new(order_params)
   @order.postal_code = current_customer.postal_code
  @order.address = current_customer.address
  @order.name = current_customer.first_name + current_customer.last_name
end
private

  def order_params
  params.require(:order).permit(:customer_id,:payment_amount,:shipping_address,:postal_code,:name,:postage,:payment_method)
  end

end
