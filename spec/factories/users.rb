# FactoryBot.define do

#   factory :user do
#     nickname {Faker::Name.name}
#     email {Faker::Internet.email}
#     password {Faker::Internet.password(min_length: 6)}
#     password_confirmation {password}
#     last_name {Faker::Name.last_name}
#     first_name {Faker::Name.first_name}
# last_name_kana {Faker::Name.last_name}
# first_name_kana {Faker::Name.first_name}
# birthday {Faker::Date.birthday}
#   end

# end

FactoryBot.define do
  factory :user do
    nickname              { 'あべ' }
    email                 { 'kkk@gmail.com' }
    password              { '00000000' }
    password_confirmation { '00000000' }
    last_name             { '阿部' }
    first_name            { '太朗' }
    last_name_kana        { 'アベ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1989-10-10' }
  end
end
