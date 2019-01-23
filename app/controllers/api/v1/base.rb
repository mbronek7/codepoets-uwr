# frozen_string_literal: true

module API
  module V1
    class Base < Grape::API
      mount API::V1::Users

      add_swagger_documentation base_path: "/api",
                                api_version: "v1",
                                info: {
                                  title: "Codepoets API",
                                  description: "Codepoets API v1"
                                },
                                hide_documentation_path: true
    end
  end
end
