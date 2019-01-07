# frozen_string_literal: true

module API
  module Entities
    module Users
      class Index < Grape::Entity
        expose :id, :name, :email
      end
    end
  end
end

