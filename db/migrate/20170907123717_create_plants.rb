class CreatePlants < ActiveRecord::Migration[5.1]
  def change

    create_table :plants, id: false do |t|
      t.integer :owner_id, unique: true
      t.integer :sensor_id, null: false
      t.string :name
      t.string :sci_name, null: false
      t.integer :zipcode, null: false
      t.text :notes
      t.timestamp :last_record

      t.timestamps
    end

    execute %Q{ ALTER TABLE "plants" ADD PRIMARY KEY (sensor_id); }
  end
end
