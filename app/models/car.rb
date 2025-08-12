class Car < ApplicationRecord
  belongs_to :make
  belongs_to :car_model
  belongs_to :year

  validates :make, :car_model, :year, presence: true
  validates :count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  validate :associations_consistent

  private
  def associations_consistent
    return unless make && car_model && year
    errors.add(:car_model, "must belong to the selected make") if car_model.make_id != make_id
    errors.add(:year, "must belong to the selected model")     if year.car_model_id != car_model_id
    errors.add(:year, "must belong to the selected make")      if year.make_id != make_id
  end
end
