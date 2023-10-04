class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def check
  end

  def withdraw
  end
  
  private
  
  def customer_params
    params.require(:customer).permit()
  end
  
end
