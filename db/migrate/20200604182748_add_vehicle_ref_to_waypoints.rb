class AddVehicleRefToWaypoints < ActiveRecord::Migration[6.0]
  def change
    add_reference :waypoints, :vehicle, foreign_key: true
  end
end
