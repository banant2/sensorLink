class EnvDatum < ApplicationRecord
  validates :sensorID, presence: true
  validates :temp, presence: true
  validates :soil_conduct, presence: true
  validates :light, presence: true
end
