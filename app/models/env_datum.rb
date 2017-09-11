class EnvDatum < ApplicationRecord
  #attr_accessible :temp, :soil_conduct, :light
  belongs_to :plant, foreign_key: 'sensor_id'

  validates :sensor_id, presence: true
  validates :temp, presence: true
  validates :soil_conduct, presence: true
  validates :light, presence: true
end
