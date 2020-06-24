# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe Api::V1::VehicleWaypointsController, type: :controller do
  let(:valid_create_params) {
    [
      {
        'latitude' => -33.435602,
        'longitude' => -70.579712,
        'sent_at' => '2016-06-02 20:50:10',
        'vehicle_identifier' => 'HA-3452'
      }
    ]
  }

  describe 'POST #create' do
    it 'returns a success response' do
      post :create, params: { _json: valid_create_params }, as: :json
      expect(response).to have_http_status(:success)
    end

    it 'enque correctly sidekiq job' do
      expect {
        post :create, params: { _json: valid_create_params }, as: :json
      }.to change(GpsWorker.jobs, :size).by(1)
    end
  end
end
