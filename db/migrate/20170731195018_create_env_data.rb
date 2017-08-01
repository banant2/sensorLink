class CreateEnvData < ActiveRecord::Migration[5.1]
  def change
    create_table :env_data do |t|
      t.integer :sensorID, null: false
      t.timestamp :record_time,  default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :temp, null: false
      t.integer :soil_conduct, null: false
      t.integer :light, null: false
    end
  end
end
