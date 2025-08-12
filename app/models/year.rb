class Year < ApplicationRecord
  belongs_to :make
  belongs_to :car_model
end
