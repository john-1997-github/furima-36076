class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index
  
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
    params.require(:order_purchase_history).permit(:postal_code , :prefecture_id, :city, :addresses, :building, :phone_number)
    .merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

def set_item
  @item = Item.find(params[:item_id])
end


def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
end

def move_to_index
  if @item.order.present? || current_user == @item.user
    redirect_to root_path
  end
end

end
