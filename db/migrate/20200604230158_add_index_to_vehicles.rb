class AddIndexToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_index :vehicles, :vehicle_identifier, :unique => true
  end
end
