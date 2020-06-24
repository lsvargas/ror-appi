# frozen_string_literal: true

module Api
  module V1
    # Vehicles Waypoints Controller
    class VehicleWaypointsController < ApiController
      before_action :set_vehicle_waypoints_data, only: %i[create]
      # Stores gps waypoints associated to a vehicle in the DB
      # Input: Array of hashes with vehicle id, and its location
      def create
        GpsWorker.perform_async(@vehicles)
      end

      def set_vehicle_waypoints_data
        @vehicles = JSON.parse(request.body.read)
      end
    end
  end
end
