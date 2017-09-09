class AddLastRecordToPlants < ActiveRecord::Migration[5.1]
  def change
    add_column :plants, :last_record, :timestamp
  end
end
