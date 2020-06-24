# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'

  get 'show', to: 'vehicles#index'

  # Route for sidekiq Web UI
  mount Sidekiq::Web => '/sidekiq'

  # Api routes
  namespace 'api' do
    namespace 'v1' do
      post 'gps', to: 'vehicle_waypoints#create'
    end
  end
end
