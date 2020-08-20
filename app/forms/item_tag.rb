class ItemTag
  include ActiveModel::Model
  attr_accessor :name, :images, :explanation, :category_id, :status_id, :fee_id, :form_id, :day_id, :price, :item_id, :user_id, :tag_name

  # 価格の範囲が、¥300~¥9,999,999の間であること
  validates :price,
            numericality: {
              greater_than_or_equal_to: 300,
              less_than: 100_000_000
            }

  # 空の投稿を保存できないようにする
  validates :name, :images, :explanation, :category_id, :status_id, :fee_id, :form_id, :day_id, :price, :tag_name, presence: true

  # 選択が「--」のままになっていないか
  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :fee_id, :form_id, :day_id
  end


  # items_controller の create アクション
  def save
    item = Item.create!(
      name: name,
      images: images,
      explanation: explanation,
      category_id: category_id,
      status_id: status_id,
      fee_id: fee_id,
      form_id: form_id,
      day_id: day_id,
      price: price,
      user_id: user_id
    )

    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    ItemTagRelation.create!(item_id: item.id, tag_id: tag.id)
  end


  # items_controller の update アクション
  def update(id)
    item = Item.find(id)
    # item.update!(
    #   name: name,
    #   images: images,
    #   explanation: explanation,
    #   category_id: category_id,
    #   status_id: status_id,
    #   fee_id: fee_id,
    #   form_id: form_id,
    #   day_id: day_id,
    #   price: price,
    #   user_id: user_id
    # )
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end



end
