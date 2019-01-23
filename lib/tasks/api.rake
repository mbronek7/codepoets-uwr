# frozen_string_literal: true

namespace :api do
  desc "Prints API routes"
  task routes: :environment do
    API::Base.routes.each do |api|
      method = api.request_method.ljust(10)
      path = api.path
      puts "#{method} #{path}"
    end
  end
end
