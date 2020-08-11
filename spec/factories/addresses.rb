FactoryBot.define do
  factory :address do
    phone_number    { '12345678900' }
    postal_code     { '123-4567' }
    form_id         { '27' }
    municipalities  { '西宮市獅子ヶ口町' }
    street          { '10-41' }
    item
  end
end
