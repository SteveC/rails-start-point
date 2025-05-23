class SessionsController < ApplicationController
  def new
    redirect_to "/auth/google_oauth2"
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path, notice: "Signed in successfully!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out successfully!"
  end
end
