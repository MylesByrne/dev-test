# spec/factories/years.rb
FactoryBot.define do
  factory :year do
    association :make
    association :car_model
    year { 2022 }
  end
end
