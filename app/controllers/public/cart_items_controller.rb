class Public::CartItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end
end
