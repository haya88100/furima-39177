class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :authenticate_user!, only: :index
  
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new

    if @item.sold_out? || @item.user == current_user
      redirect_to root_path
    end
  end
  
  def new
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
    item_id = params[:item_id]
    item = Item.find(item_id)   
    params.require(:order_address).permit(:postal_code, :shopping_area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], price: item.price, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: order_params[:price],  
      card: order_params[:token],   
      currency: 'jpy'                
    )
  end

end
