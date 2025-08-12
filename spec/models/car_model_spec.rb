# spec/models/car_model_spec.rb
require "rails_helper"

RSpec.describe CarModel, type: :model do
  it "requires name and make" do
    expect(CarModel.new(name: nil, make: build(:make))).not_to be_valid
    expect(CarModel.new(name: "3 Series", make: nil)).not_to be_valid
  end

  it "is unique per make" do
    bmw = create(:make, name: "BMW")
    create(:car_model, name: "3 Series", make: bmw)
    expect(CarModel.new(name: "3 Series", make: bmw)).not_to be_valid
  end
end
