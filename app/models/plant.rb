class Plant < ApplicationRecord

  self.primary_key= 'sensorID'
  validates :sensorID, presence: true
  validates :sci_name, presence: true
  validates :zipcode, presence: true

end
