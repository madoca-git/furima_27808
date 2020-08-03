class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i }
    
    with_options format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ } do
      validates :last_name
      validates :first_name
    end
    
    with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end
    
  end

end
