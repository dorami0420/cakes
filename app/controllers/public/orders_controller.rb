class Public::OrdersController < ApplicationController
  
def new
    @order = Order.new
end

 def update
      @customer = current_customer
      if @customer.update(customer_params)
        flash[:notice] = "You have updated user successfully."
          redirect_to customers_mypage_path
    　else
          render :edit
      end
  end

private

  def customer_params
  params.require(:cutomer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
  end

end
