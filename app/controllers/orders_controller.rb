class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item,only: [:index, :create]

  def index
    
    if current_user.id == @item.user.id ||  Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
    set_public_key
    @order_address = OrderAddress.new
  end

  def create
   
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      set_public_key
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :origin_region_id, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.cost,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_public_key
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end
end
