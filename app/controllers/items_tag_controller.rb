class ItemsTagController < ApplicationController
  # def new
  #   @item = ItemsTag.new
  # end

  # def create
  #   @item = ItemsTag.new(item_tag_patams)
  #   if @item.valid?
  #     @item.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  # private

  # def item_tag_patams
  #   params.require(:item).permit(
  #     :name,
  #     :explanation,
  #     :category_id,
  #     :status_id,
  #     :fee_id,
  #     :form_id,
  #     :day_id,
  #     :price,
  #     images: []
  #   ).merge(user_id: current_user.id)
  # end
end
