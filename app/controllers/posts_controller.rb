# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i(edit update destroy)
  before_action :authorize, only: %i(new edit update destroy)

  def index
    @posts = if params[:tag]
               Post.tagged_with(params[:tag])
             else
               PostWithPopularityQuery.call
             end
  end

  def show
    @post = Post.includes(:tags).friendly.find(params[:id])
    impressionist(@post)
    fresh_when etag: @post
  end

  def new
    @post = Post.new
  end

  def edit; end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end
end
