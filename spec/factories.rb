FactoryBot.define do
  factory :user do
    name { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :project do
    title { Faker::App.name }
    user_id { 1 }
  end
end
