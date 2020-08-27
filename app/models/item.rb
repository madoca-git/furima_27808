class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :form
  belongs_to_active_hash :day

  has_many :messages
  has_many :item_tag_relations, dependent: :destroy
  has_many :tags, through: :item_tag_relations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  belongs_to :user
  has_one :address
  has_one :order
  has_many_attached :images

  def self.search(search)
    if search != ''
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.order('created_at DESC')
    end
  end
end
