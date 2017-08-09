class AddIndexToPlants < ActiveRecord::Migration[5.1]
  def change
    add_index :plants, :sensorID, unique: true
  end
end
