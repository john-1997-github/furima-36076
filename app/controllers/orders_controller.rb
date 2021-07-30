class OrdersController < ApplicationController
  before_action :set_item
  
  def index
    @purchase_history = PurchaseHistory.new
  end

  def create
    @purchase_history = PurchaseHistory.new(order_params)
  end


  private 
  
  def order_params
    params.require(:purchase_history).permit(:postal_code , :prefecture_id, :city, :addresses, :building, :phone_number)
    .merge(user_id: current_user.id, item_id: params[:item_id])
  end

def set_item
  @item = Item.find(params[:item_id])
end


end
