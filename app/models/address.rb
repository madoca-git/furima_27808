class Address < ApplicationRecord
  belongs_to :item

  with_options presence: true do
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :form_id
    validates :municipalities
    validates :street
  end

  with_options numericality: { other_than: 1 } do
    validates :form_id
  end
end
