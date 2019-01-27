# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :correct_user, only: %i(edit update)

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new
    validation = UserValidator::NewUserSchema.with(record: @user)
                                             .call(params.permit!.to_h)

    if validation.success?
      @user.attributes = validation.output[:user]
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account Created!"
    else
      redirect_to signup_path, alert: create_user_flash(validation.errors(full: true))
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
    @user = User.includes(:posts, :following, :followers).friendly.find(params[:id])
    @user_presenter = UserPresenter.new(@user)
    fresh_when etag: @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
                                 :biography, :proffesion, :website_url, :avatar)
  end

  def correct_user
    @user = User.friendly.find(params[:id])
    redirect_to login_path, notice: "You are not alolowed to edit this profile" if @user != current_user
  end

  def create_user_flash(errors)
    flash = []
    errors[:user].each do |error|
      flash << error[1].first
    end
    flash.join("<br />".html_safe.to_s)
  end
end
