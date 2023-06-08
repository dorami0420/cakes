class Public::OrdersController < ApplicationController
 before_action :authenticate_customer!
def new
    @order = Order.new

end

def confirm
  @order = Order.new(order_params)
#binding.pry

    if params[:order][:address_option] == "0"
       @order.postal_code = current_customer.postal_code
        @order.shipping_address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
        @order.postal_code = params[:order][:postal_code]
        @order.shipping_address = params[:order][:shipping_address]
        @order.name = params[:order][:name]
    else
            render 'new'
    end
    @cart_items = current_customer.cart_items.all
        @order.customer_id = current_customer.id

end

def create
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        @order.save

 current_customer.cart_items.each do |cart_item|
          @ordered_detail = OrderDetail.new
          @ordered_detail.item_id = cart_item.item_id
          @ordered_detail.amount = cart_item.amount
          @ordered_detail.price = (cart_item.item.price*1.08).floor
          @ordered_detail.order_id =  @order.id
          @ordered_detail.save
        end

        current_customer.cart_items.destroy_all
        redirect_to  public_orders_thanks_path
end

    def thanks
    end


    def index
        @orders = current_customer.orders
    end

   
def show
  @order = Order.find(params[:id])
  @order_d = @order.order_details
@sum = 0
end


private

  def order_params
  params.require(:order).permit(:customer_id,:payment_amount,:shipping_address,:postal_code,:name,:postage,:payment_method)
  end

end
