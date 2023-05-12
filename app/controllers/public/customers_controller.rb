class Public::CustomersController < ApplicationController
   @customer = current_end_user
end


 def edit
     @customer = Customer.find(params[:id])
      unless @customer == current_user
        redirect_to customer_path(current_user)
      end
 end
 
  def update
      @customer = current_user
  if @customer.update(customer_params)
    flash[:notice] = "You have updated user successfully."
      redirect_to customer_path
  else
      render :edit
  end
  end

private

  def customer_params
  params.require(:cutomer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
  end