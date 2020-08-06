FactoryBot.define do
  factory :item do
    name              { 'TEST' }
    explanation       { 'テストです' }
    category_id       { '2' }
    status_id         { '3' }
    fee_id            { '2' }
    form_id           { '30' }
    day_id            { '3' }
    price             { '5000' }
    user
  end
end
