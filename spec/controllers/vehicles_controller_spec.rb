# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VehiclesController, type: :controller do
  let(:valid_attributes) { { vehicle_identifier: 'HA-3452' } }

  describe 'GET #index' do
    it 'returns a success response' do
      vehicle = Vehicle.create! valid_attributes
      FactoryBot.create(:waypoint, vehicle: vehicle)
      get :index, params: {}

      expect(response).to be_successful
    end
  end
end
