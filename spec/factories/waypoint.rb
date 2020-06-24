# frozen_string_literal: true

FactoryBot.define do
  factory :waypoint do
    latitude { -33.435602 }
    longitude { -70.579712 }
    sent_at { '2016-06-02 20:50:10' }
    vehicle_id { nil }
  end
end
