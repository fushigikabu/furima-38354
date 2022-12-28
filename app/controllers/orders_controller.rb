class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])

    if user_signed_in? && current_user.id == @item.user_id
    redirect_to root_path 
    end

  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = "sk_test_ad4deffca71d9cf49e8ace4a" #秘密鍵
      Payjp::Charge.create(
        amount: @item.item_price,  #確認いるかも
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
