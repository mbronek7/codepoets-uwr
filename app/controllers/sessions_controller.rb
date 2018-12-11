# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:email])
    p user
    p params[:email]
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Succesfully authenticated'
      redirect_to root_path
    else
      flash[:error] = 'Could not authenticate, please try again'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
