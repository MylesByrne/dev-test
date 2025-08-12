class Car < ApplicationRecord
  belongs_to :make
  belongs_to :car_model
  belongs_to :year
end
