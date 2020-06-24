# frozen_string_literal: true

# Vehicle controller
class VehiclesController < ApplicationController
  def index
    @vehicle = Vehicle.last
    @waypoint = @vehicle.waypoints.order(sent_at: :desc).first.attributes if @vehicle
  end
end
