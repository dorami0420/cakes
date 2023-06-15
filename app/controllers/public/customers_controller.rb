class Public::CustomersController < ApplicationController

def cancel
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to  new_customer_registration_path
end

def confirm
end

def show
    @customer = current_customer

end


def edit
    @customer = current_customer

end

def update
    @customer = current_customer
if  @customer.update(customer_params)
          redirect_to customers_mypage_path
else
          render :edit
end 
end
  

private

def customer_params
  params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
end

end