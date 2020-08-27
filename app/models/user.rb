class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :items
  has_many :orders
  has_many :user_tag_relations
  has_many :tags, through: :user_tag_relations
  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item
  has_many :sns_credentials
  has_one  :name
  def already_liked?(item)
    likes.exists?(item_id: item.id)
  end

  validates_uniqueness_of :nickname, case_sensitive: true

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A[a-z0-9]+\z/i }

    VALID_PASSWORD_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/.freeze
    validates :last_name, format: { with: VALID_PASSWORD_REGEX }
    validates :first_name, format: { with: VALID_PASSWORD_REGEX }

    with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
