FactoryBot.define do
  factory :user do
    nickname { '田中' }
    last_name { '田中' }
    first_name { '田中' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'タナカ' }
    birthday { Faker::Date.birthday }
    email { Faker::Internet.free_email }
    password = 'aaa000'
    password { password }
    password_confirmation { password }
  end
end
