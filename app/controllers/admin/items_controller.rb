class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.customer_id = current_customer.id
    @item.save
  end

  def show
  end

  def edit
  end

  def update
  end
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end
  
end
