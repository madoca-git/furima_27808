class ItemOrder
  include ActiveModel::Model
  attr_accessor :form_id, :phone_number, :postal_code, :municipalities, :street, :building, :item_id, :user_id, :token

  # 空の投稿を保存できないようにする+format
  with_options presence: true do
    VALID_PASSWORD_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :postal_code,  format: { with: /\A\d{3}[-]\d{4}\z/ }

    validates :form_id
    # validates :day_id
    validates :municipalities, format: { with: VALID_PASSWORD_REGEX }
    validates :street
  end

  # 選択が「--」のままになっていないか
  with_options numericality: { other_than: 1 } do
    validates :form_id
  end

  def save
    Address.create!(phone_number: phone_number, postal_code: postal_code, form_id: form_id, municipalities: municipalities, street: street, building: building, item_id: item_id)
    Order.create(user_id: user_id, item_id: item_id)
  end
end