class Admin::CustomersController < ApplicationController
def index
   @customers = Customer.all

end

def show
  @customer = Customer.find(params[:id])
  
end

def update
    @customer.update(customer_params)
    redirect_to request.referer, notice: 'Successfully updated customer status'
end
  
  def customer_params
    params.require(:customer).permit(:status)
  end
  
end
