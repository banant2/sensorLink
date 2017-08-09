class Plant < ApplicationRecord

  self.primary_key= 'sensorID'
  validates :sensorID, presence: true, uniqueness:{ message: 'Error: cannot save, sensorID is already registered' }
  validates :sci_name, presence: true
  validates :zipcode, presence: true

end
