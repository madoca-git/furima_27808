class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_many :user_tag_relations
  has_many :tags, through: :user_tag_relations
  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item
  def already_liked?(item)
    likes.exists?(item_id: item.id)
  end

  validates_uniqueness_of :nickname, case_sensitive: true

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, format: { with: /\A[a-z0-9]+\z/i }

    VALID_PASSWORD_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/.freeze
    validates :last_name, format: { with: VALID_PASSWORD_REGEX }
    validates :first_name, format: { with: VALID_PASSWORD_REGEX }

    with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end
