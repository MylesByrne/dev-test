# spec/factories/makes.rb
FactoryBot.define do
  factory :make do
    sequence(:name) { |n| "Make#{n}" }
  end
end
