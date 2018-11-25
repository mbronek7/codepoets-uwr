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

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def correct_user
    @pin = current_user.posts.friendly.find(params[:id])
    redirect_to author_post_path, notice: 'Nie jesteś uprawniony do edycji tego postu' if @pin.nil?
  end

  def set_post
    @post = Post.friendly.find(params[:id])
  end
end
