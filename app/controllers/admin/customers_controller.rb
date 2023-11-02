class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "会員情報を更新しました。"
    else
      render :edit
    end
  end
  
  
  def customer_params
    params.require(:customer).permit(
      :last_name, :last_name_kana,
      :first_name, :first_name_kane,
      :email, :postal_code, :address, :telephone_number, :is_active
      )
  end
end
