class Name < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :birthday

    VALID_PASSWORD_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/.freeze
    validates :last_name, format: { with: VALID_PASSWORD_REGEX }
    validates :first_name, format: { with: VALID_PASSWORD_REGEX }

    with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end
