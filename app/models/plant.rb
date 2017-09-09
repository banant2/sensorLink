class Plant < ApplicationRecord
  belongs_to :user, optional: true
  has_many :EnvDatum, foreign_key: "sensor_id"
  accepts_nested_attributes_for :user

  self.primary_key= 'sensor_id'
  validates :sensor_id, presence: true, uniqueness:{ message: 'Error: cannot save, sensor_id is already registered' }
  validates :sci_name, presence: true
  validates :zipcode, presence: true
  validates :owner_id, presence: true

end
