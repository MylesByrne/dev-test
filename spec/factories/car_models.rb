# spec/factories/car_models.rb
FactoryBot.define do
  factory :car_model do
    association :make
    sequence(:name) { |n| "Model#{n}" }
  end
end
