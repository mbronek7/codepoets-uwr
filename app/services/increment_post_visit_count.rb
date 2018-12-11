# frozen_string_literal: true

class IncrementPostVisitCount < ApplicationService
  attr_reader :post

  def initialize(post)
    @post = post
  end

  def call
    post.increment!(:visit_count)
  end
end
