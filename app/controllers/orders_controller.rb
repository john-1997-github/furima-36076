class OrdersController < ApplicationController

  def index
    @purchase_history = PurchaseHistory.new
  end

  def create
  end

end
