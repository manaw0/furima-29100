class ItemsController < ApplicationController
  def index 
    @items = Item.all
  end

  def new 
    @Item = Item.new
  end

  def create
    Item.create(item_params)
    if @message.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :shipping_days_id).merge(user_id: current_user.id)
  end
end
