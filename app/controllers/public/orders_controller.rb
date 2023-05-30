class Public::OrdersController < ApplicationController
  
def new
    @order = Order.new
end

def confirm
  @order = Order.new(order_params)
   @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
  
    if params[:order][:address_option] == "0"
       @order.shipping_post_code = current_member.post_code
        @order.shipping_address = current_member.address
        @order.shipping_name = current_member.last_name + current_member.first_name  
    elsif params[:order][:address_option] = "2"
        @order.shipping_post_code = params[:order][:shipping_post_code]
        @order.shipping_address = params[:order][:shipping_address]
        @order.shipping_name = params[:order][:shipping_name]
    else
            render 'new'
    end
    @cart_items = current_member.cart_items.all
        @order.member_id = current_member.id
        
end

 def create
        @order = Order.new(order_params)
        @order.member_id = current_member.id
        @order.save

    
        current_member.cart_items.each do |cart_item| 
          @ordered_item = OrderedItem.new 
          @ordered_item.item_id = cart_item.item_id 
          @ordered_item.quantity = cart_item.quantity 
          @ordered_item.tax_included_price = (cart_item.item.price*1.08).floor 
          @ordered_item.order_id =  @order.id 
          @ordered_item.save 
        end 

        current_member.cart_items.destroy_all 
        redirect_to thanx_orders_path
    end
    
    def thanks
    end

    
    def index
        @orders = current_member.orders
    end
    
    def show
        @order = Order.find(params[:id])
        @ordered_items = @order.ordered_items
    end



private

  def order_params
  params.require(:order).permit(:customer_id,:payment_amount,:shipping_address,:postal_code,:name,:postage,:payment_method)
  end

end
