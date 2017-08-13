class Plant < ApplicationRecord
  belongs_to :user, optional: true
  accepts_nested_attributes_for :user

  self.primary_key= 'sensorID'
  validates :sensorID, presence: true, uniqueness:{ message: 'Error: cannot save, sensorID is already registered' }
  validates :sci_name, presence: true
  validates :zipcode, presence: true
  validates :owner_id, presence: true

end
