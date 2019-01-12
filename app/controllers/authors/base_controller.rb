# frozen_string_literal: true

module Authors
  class BaseController < ApplicationController
    before_action :authorize
  end
end
