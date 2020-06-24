# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'fixture object' do
    before(:each) do
      @vehicle = FactoryBot.create(:vehicle)
    end

    it 'should be valid' do
      actual = @vehicle.valid?
      expected = true

      expect(actual).to eq expected
    end

    it 'should be invalid without a vehicle_identifier' do
      @vehicle.vehicle_identifier = nil

      actual = @vehicle.valid?
      expected = false

      expect(actual).to be expected
    end
  end

  describe 'model methods' do
    let(:veh_params) { { 
      'vehicle_identifier' => 'SHA-256',
      'latitude' => -33.435602,
      'longitude' => -70.579712,
      'sent_at' => '2016-06-02 20:50:10'
    } }

    context '#update_waypoints' do
      before(:each) do
        @vehicle = FactoryBot.create(:vehicle)
      end

      it 'updates vehicles waypoints correctly' do
        Vehicle.update_waypoints(@vehicle, veh_params)
        expect(@vehicle.waypoints.count).to eq 1
      end

      it 'fails to update vehicle must be present' do
        expect { Vehicle.update_waypoints(nil, veh_params) }
          .to raise_exception(ActiveRecord::RecordInvalid)
      end

      it 'fails to update waypoints params must be present' do
        expect { Vehicle.update_waypoints(@vehicle, {}) }
          .to raise_exception(ActiveRecord::RecordInvalid)
      end
    end

    context '#create_and_update_waypoints' do
      it 'creates vehicle correctly' do
        Vehicle.create_and_update_waypoints(veh_params)

        expect(Vehicle.find_by_vehicle_identifier('SHA-256').present?).to be_truthy
      end

      it 'updates vehicles waypoints correctly' do
        Vehicle.create_and_update_waypoints(veh_params)

        expect(
          Vehicle.find_by_vehicle_identifier('SHA-256').waypoints.count
        ).to eq 1
      end

      it 'fails to create because of vehicle invalid params' do
        expect { Vehicle.create_and_update_waypoints({}) }
          .to raise_exception(ActiveRecord::RecordInvalid)
      end

      it 'fails to update, no waypoints params' do
        veh_params = { 'vehicle_identifier' => 'SHA-256' }
        expect { Vehicle.create_and_update_waypoints(veh_params) }
          .to raise_exception(ActiveRecord::RecordInvalid)
      end
    end
  end
end
