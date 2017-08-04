class Plant < ApplicationRecord

  validates :sensorID, presence: true
  validates :sci_name, presence: true
  validates :zipcode, presence: true

end
