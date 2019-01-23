# frozen_string_literal: true

module API
  module Entities
    module Users
      class User < Grape::Entity
        expose :id, :name, :email, :biography, :birthdate, :proffesion, :website_url
      end
    end
  end
end

