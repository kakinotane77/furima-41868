FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { 'password1' } # 必ず英字と数字を含む
    password_confirmation { 'password1' }
    last_name             { '山田' } # 全角漢字
    first_name            { '太郎' } # 全角漢字
    last_name_kana        { 'ヤマダ' } # 全角カタカナ
    first_name_kana       { 'タロウ' } # 全角カタカナ
    birth_date            { Faker::Date.birthday }
  end
end
