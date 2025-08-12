class Year < ApplicationRecord
  belongs_to :make
  belongs_to :car_model
  validates :year, presence: true
  validates :year, numericality: { only_integer: true }
  validates :year, uniqueness: { scope: [:make_id, :car_model_id] }

  validate :car_model_matches_make

  private

  def car_model_matches_make
    return unless car_model && make
    errors.add(:car_model, "must belong to the selected make") if car_model.make_id != make_id
  end
end