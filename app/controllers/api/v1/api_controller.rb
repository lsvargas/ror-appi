# frozen_string_literal: true

module Api
  module V1
    # API Controller
    class ApiController < ActionController::Base
      skip_before_action :verify_authenticity_token

      # Here you can insert permissions related to the Application's Auth
    end
  end
end
