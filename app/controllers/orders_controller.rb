class OrdersController < ApplicationController
  before_action :set_order, only: [:create, :show, :pay]

  def create
    @order = ItemOrder.new(order_params)
    if @order.valid?
      pay
      @order.save
      redirect_to root_path
    else
      render :show
    end
  end


  def show
    redirect_to root_path if current_user.id == @item.user_id
    redirect_to root_path if @item.order.present?
  end

  private

  def pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def order_params
    params.permit(
      :form_id,
      :phone_number,
      :postal_code,
      :municipalities,
      :street,
      :token,
      :building
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_order
    @item = Item.find_by(id: params[:item_id])
  end
end
