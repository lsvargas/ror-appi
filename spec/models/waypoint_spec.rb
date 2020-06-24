# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Waypoint, type: :model do
  describe 'fixture object' do
    before(:each) do
      vehicle = FactoryBot.create(:vehicle)
      @waypoint = FactoryBot.create(:waypoint, vehicle: vehicle)
    end

    it 'should be valid' do
      actual = @waypoint.valid?
      expected = true

      expect(actual).to be expected
    end

    it 'should not be valid if lat is nil' do
      @waypoint.latitude = nil

      actual = @waypoint.valid?
      expected = false

      expect(actual).to be expected
    end

    it 'should not be valid if lng has bad format' do
      @waypoint.longitude = nil

      actual = @waypoint.valid?
      expected = false

      expect(actual).to be expected
    end
  end
end
