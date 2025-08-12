class CarModel < ApplicationRecord
  belongs_to :make
  has_many :years, dependent: :destroy
  validates :name, presence: true, uniqueness: { scope: :make_id }
end