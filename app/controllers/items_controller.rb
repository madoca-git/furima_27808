class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @items = Item.order('created_at DESC')
    @likes = Like.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = ItemTag.new(item_tag_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @messages = Message.all
    @message = Message.new
    @tagname = @item.tags[0][:tag_name]
    @like = Like.new
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
    @tag = ItemTag.new(item_tag_params)
    if @tag.update
      @item.update(tag_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find_by(id: params[:id])
    if item.destroy!
      redirect_to root_path
    else
      render :show
    end
  end

  def search_tag
    return nil if params[:input] == ''
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:input]}%"])
    render json: { keyword: tag }
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private

  def item_tag_params
    params.require(:item).permit(
      :tag_name,
      :name,
      :explanation,
      :category_id,
      :status_id,
      :fee_id,
      :form_id,
      :day_id,
      :price,
      images: []
    ).merge(user_id: current_user.id)
  end

  def tag_params
    params.require(:item).permit(
      :name,
      :explanation,
      :category_id,
      :status_id,
      :fee_id,
      :form_id,
      :day_id,
      :price,
      images: []
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find_by(id: params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
