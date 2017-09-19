class SessionsController < ApplicationController
  def create
    session[:uid] = auth_hash.uid
    session[:user] = auth_hash.info.nickname
    session[:oauth_token] = auth_hash.credentials.token
    session[:oauth_secret] = auth_hash.credentials.secret
    redirect_to root_path, notice: "Logged in as #{auth_hash.info.nickname}."
  end

  # Log a user out by removing data from the session.
  def destroy
    [:uid, :user, :oauth_token, :oauth_secret].map { |sym| session[sym] = nil }
    redirect_to root_path, notice: "You've been logged out."
  end 

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end