# frozen_string_literal: true

class Author::PostsController < ApplicationController
  before_action :authorize, only: %i[new edit update destroy]
  before_action :correct_user, only: %i[edit update destroy]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = current_user.posts.order('created_at DESC')
  end

  def show; end

  def edit
    @pin
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created'
    else
      render action: :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post has been deleted'
    redirect_to posts_path
  end

  private

  def correct_user
    @pin = current_user.posts.friendly.find(params[:id])
    redirect_to author_post_path, notice: 'You are not allowed to edit this post' if @pin.nil?
  end

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
