class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  
  def index
    #@items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :memo, :category_id, :status_id, :chage_bearer_id, :shopping_area_id, :delivary_day_id, :price)
  end

end
