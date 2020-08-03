FactoryBot.define do
  factory :user do
    nickname              { 'あべ' }
    email                 { 'kkk@gmail.com' }
    password              { '00000a' }
    password_confirmation { '00000a' }
    last_name             { '阿部' }
    first_name            { '太朗' }
    last_name_kana        { 'アベ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1989-10-10' }
  end
end
