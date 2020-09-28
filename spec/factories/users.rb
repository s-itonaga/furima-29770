FactoryBot.define do
  factory :user do
    nickname                  { '砂糖' }
    email                     { 'test@gmail.com' }
    password                  { '1234ab' }
    password_confirmation     { password }
    family_name               { '佐藤' }
    name                      { '孝雄' }
    pronuciation_family_name  { 'サトウ' }
    pronuciation_name         { 'タカオ' }
    birth_date                { '1976-09-14' }
  end
end
