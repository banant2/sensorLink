class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.integer :sensorID, null: false
      t.string :name
      t.string :sci_name, null: false
      t.string :nickname
      t.integer :zipcode, null: false
      t.text :notes

      t.timestamps
    end
  end
end
