class AddStateIdCityIdLocalityIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :state_id, :integer
    add_column :locations, :city_id, :integer
    add_column :locations, :locality_id, :integer
  end
end
