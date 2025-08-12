# app/models/year.rb
class Year < ApplicationRecord
  belongs_to :make
  belongs_to :car_model

  validates :year, presence: true, numericality: { only_integer: true }
  validates :car_model, presence: true
  validates :make, presence: true
  validates :year, uniqueness: { scope: [:make_id, :car_model_id] }

  validate :car_model_belongs_to_make

  private

  def car_model_belongs_to_make
    return unless car_model && make
    if car_model.make_id != make_id
      errors.add(:car_model, "must belong to the selected make")
    end
  end
end
