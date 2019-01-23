# frozen_string_literal: true

module Authors
  class PostsController < BaseController
    before_action :correct_user, only: %i(edit update destroy)
    before_action :set_post, only: %i(show edit update destroy)

    def index
      @posts = current_user.posts.order("created_at DESC")
    end

    def show; end

    def edit
      @pin
    end

    def new
      @post = Post.new
    end

    def create
      transaction = CreatePost.new
      transaction.call(post_params.merge!(author_id: @current_user.id)) do |result|
        result.success do |post|
          flash[:notice] = "Post was successfully created"
          redirect_to post_path(post)
        end

        result.failure :validate do |errors|
          @post = Post.new(post_params)
          @errors = errors
          flash[:alert] = "Post could not be created. Due to the error below:<br /> #{create_flash(@errors)}"
          render :new
        end
      end
    end

    def update
      if @post.update(post_params)
        redirect_to @post, notice: "Post was successfully updated."
      else
        render action: :edit
      end
    end

    def destroy
      @post.destroy
      flash[:success] = "Post has been deleted"
      redirect_to authors_posts_path
    end

    private

    def correct_user
      @pin = current_user.posts.friendly.find(params[:id])
      redirect_to author_post_path, notice: "You are not allowed to edit this post" if @pin.nil?
    end

    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :all_tags).to_h
    end

    def create_flash(errors)
      flash = []
      errors.each do |error|
        flash << error.first.to_s + " " + error.second.first
      end
      flash.join("<br />".html_safe.to_s)
    end
  end
end
