class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_user, only: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]

  def index
    @order_purchase_history = OrderPurchaseHistory.new
  end

  def create
    # binding.pry
    @order_purchase_history = OrderPurchaseHistory.new(order_params)
    if @order_purchase_history.valid?
      pay_item
      @order_purchase_history.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_purchase_history).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_user
    redirect_to root_path if current_user.id == @item.user_id
  end

  def sold_out_item
    redirect_to root_path if @item.order.present?
  end
end
