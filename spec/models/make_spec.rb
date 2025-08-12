require "rails_helper"

RSpec.describe Make, type: :model do
  it "requires name" do
    expect(Make.new).not_to be_valid
  end

  it "enforces uniqueness" do
    create(:make, name: "BMW")
    expect(Make.new(name: "BMW")).not_to be_valid
  end
end
