class CreatePlants < ActiveRecord::Migration[5.1]
  def change

    create_table :plants, id: false do |t|
      t.integer :owner_id
      t.integer :sensorID, null: false
      t.string :name
      t.string :sci_name, null: false
      t.string :nickname
      t.integer :zipcode, null: false
      t.text :notes

      t.timestamps
    end

    execute %Q{ ALTER TABLE "plants" ADD PRIMARY KEY ("sensorID"); }
  end
end
