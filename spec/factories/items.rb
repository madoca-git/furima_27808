FactoryBot.define do
  factory :item do
    name              { 'TEST' }
    explanation       { 'テストです' }
    category_id       { '2' }
    status_id         { '3' }
    delivary_fee_id   { '2' }
    delivary_form_id  { '30' }
    delivary_days_id  { '3' }
    price             { '5000' }
    user
  end
end
