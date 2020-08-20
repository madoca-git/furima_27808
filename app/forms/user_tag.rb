class UserTag
  # include ActiveModel::Model
  # attr_accessor :name, :images, :explanation, :category_id, :status_id, :fee_id, :form_id, :day_id, :price, :tag_name

  # # 価格の範囲が、¥300~¥9,999,999の間であること
  # validates :price,
  #           numericality: {
  #             greater_than_or_equal_to: 300,
  #             less_than: 100_000_000
  #           }

  # # 空の投稿を保存できないようにする
  # validates :name, :images, :explanation, :category_id, :status_id, :fee_id, :form_id, :day_id, :price, :tag_name, presence: true

  # # 選択が「--」のままになっていないか
  # with_options numericality: { other_than: 1 } do
  #   validates :category_id, :status_id, :fee_id, :form_id, :day_id
  # end

  # def save
  #   item = Item.create(
  #     name: name, 
  #     imagesg: images, 
  #     explanation: explanation, 
  #     category_id: category_id, 
  #     status_id: status_id, 
  #     fee_id: fee_id, 
  #     form_id: form_id, 
  #     day_id: day_id, 
  #     price: price
  #   )

  #   tag = Tag.create(tag_name: tag_name)

  #   ItemsTag.create(item_id: item.id, tag_id: tag.id)
  # end
end