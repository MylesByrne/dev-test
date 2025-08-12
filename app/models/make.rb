class Make < ApplicationRecord
  has_many :car_models, dependent: :destroy
  has_many :years, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end