class Car < ApplicationRecord
  belongs_to :make
  belongs_to :car_model
  belongs_to :year

  validate :associations_consistent

  private

  def associations_consistent
    errors.add(:car_model, "must belong to selected make") if car_model && make && car_model.make_id != make_id
    errors.add(:year, "must belong to selected model") if year && car_model && year.car_model_id != car_model_id
    errors.add(:year, "must belong to selected make") if year && make && year.make_id != make_id
  end
end