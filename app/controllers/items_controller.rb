class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_owner, only: [:edit, :update, :destroy]
  
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item
  end

  def edit
    @item
    if @item.sold_out?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item
    @item.destroy

    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :memo, :category_id, :status_id, :chage_bearer_id, :shopping_area_id, :delivary_day_id, :price).merge(user: current_user)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def redirect_if_not_owner
    unless @item.user == current_user
      redirect_to action: :index
    end
  end



end
