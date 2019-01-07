# frozen_string_literal: true

module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        version "v1"
        format :json

        rescue_from ActiveRecord::RecordNotFound do |e|
          error_response(message: e.message, status: 404)
        end

        rescue_from :all do |e|
          if Rails.env.development?
            raise e
          else
            Raven.capture_exception(e)
            error_response(message: "Internal server error", status: 500)
          end
        end
      end
    end
  end
end
