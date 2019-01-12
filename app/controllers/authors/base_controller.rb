# frozen_string_literal: true

module Authors
  class BaseController < ApplicationController
    before_action :authorize

    def create_flash(errors)
      flash = []
      errors.each do |error|
        flash << error[1].first
      end
      flash.join("<br />".html_safe.to_s)
    end
  end
end
