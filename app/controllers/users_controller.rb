# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :correct_user, only: %i(edit update)

  def new
    @user = User.new
  end

  def edit; end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to root_path, notice: "Your profile was successfully updated."
    else
      render action: :edit
    end
  end

  def show
    @user = User.includes(:posts, :following, :followers).find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :biography, :proffesion, :website_url)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to login_path, notice: "You are not alolowed to edit this profile" if @user != current_user
  end
end
