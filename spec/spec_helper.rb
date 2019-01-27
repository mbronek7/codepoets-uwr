# frozen_string_literal: true

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require "support/factory_bot"
require "dry-validation"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
  end
end
