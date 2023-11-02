class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  # カート商品を追加・保存
  # def create
  #   @cart_item = CartItem.new(cart_item_params)
  #   # もし元々カート内に「同じ商品」がある場合、「数量を追加」更新・保存する
  #   #ex.バナナ２個、バナナ２個ではなく　バナナ「4個」にしたい
  #   if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
  #     #元々カート内にあるもの「item_id」
  #     #今追加した　　　　　　　params[:cart_item][:item_id])
  #     @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
  #     @cart_item.amount += params[:cart_item][:amount].to_i #cart_item.amountに今追加したparams[:cart_item][:amount]を加える .to_iとして数字として扱う
  #     @cart_item.save
  #     redirect_to cart_items_path
  #   elsif @cart_item.save # もしカート内に「同じ」商品がない場合は通常の保存処理
  #     @cart_items = current_customer.cart_items.all
  #     render :index
  #   else　# 保存できなかった場合
  #     render :index
  #   end
  # end
  
  # カートへの追加or既に存在する商品の個数更新
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id=current_customer.id
      @cart_items = current_customer.cart_items.all
        @cart_items.each do |cart_item|
          if cart_item.item_id==@cart_item.item_id
          new_quantity = cart_item.quantity + @cart_item.quantity
          cart_item.update_attribute(:quantity, new_quantity)
          @cart_item.delete
          end
        end

        @cart_item.save
        redirect_to cart_items_path,notice:"カートに商品が入りました"
    # # もし元々カート内に「同じ商品」がある場合、「数量を追加」更新・保存する
    # if @cart_item.present?
    #   @cart_item.amount += params[:cart_item][:amount].to_i
    #   redirect_to cart_items_path
    # else # elsif  @cart_item.save
    #   # @cart_item = current_customer.cart_items.all
    #   @cart_item = current_customer.cart_items.build(item_id: params[:cart_item][:item_id]).save
    #   render :index
    # # else　# 保存できなかった場合
    #   # render :index
    # end
  end
  

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

  
end
