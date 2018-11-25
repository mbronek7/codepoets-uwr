# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize, only: %i[new edit update destroy]

  def index
    @posts = PostWithPopularityQuery.call
  end

  def show
    IncrementPostVisitCount.call(@post)
  end

  def new
    @post = Post.new
  end

  def edit; end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
