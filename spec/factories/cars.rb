# spec/factories/cars.rb
FactoryBot.define do
  factory :car do
    association :make
    association :car_model
    association :year
    trim  { "SE" }
    count { 1 }
  end
end
