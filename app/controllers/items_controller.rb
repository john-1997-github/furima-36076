class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @itmes = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def prototype_params
  #   params.require(:item).permit(:, :, :, :image).merge(user_id: current_user.id)
  # end
end
