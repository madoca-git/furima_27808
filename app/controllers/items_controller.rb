class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
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
    @item = Item.find_by(id: params[:id])
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end
  
  def update
    @item = Item.find_by(id: params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :explanation,
      :category_id,
      :status_id,
      :fee_id,
      :form_id,
      :day_id,
      :price
    ).merge(user_id: current_user.id)
  end
end
