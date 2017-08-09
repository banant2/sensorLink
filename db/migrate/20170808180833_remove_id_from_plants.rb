class RemoveIdFromPlants < ActiveRecord::Migration[5.1]
  def change
    remove_column :plants, :id, :bigint
  end
end
