class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :form
  belongs_to_active_hash :day

  belongs_to :user
  has_one :address
  has_one :order
  has_one_attached :image

  # 価格の範囲が、¥300~¥9,999,999の間であること
  validates :price,
            numericality: {
              greater_than_or_equal_to: 300,
              less_than: 100_000_000
            }

  # 空の投稿を保存できないようにする
  validates :name, :image, :explanation, :category_id, :status_id, :fee_id, :form_id, :day_id, :price, presence: true

  # 選択が「--」のままになっていないか
  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :fee_id, :form_id, :day_id
  end
end
