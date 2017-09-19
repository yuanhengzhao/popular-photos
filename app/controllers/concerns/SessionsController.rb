class SessionsController < ApplicationController
  def create
    session[:uid] = auth_hash.uid
    session[:user] = auth_hash.info.nickname
    session[:oauth_token] = auth_hash.credentials.token
    session[:oauth_secret] = auth_hash.credentials.secret
    redirect_to root_path, notice: "Logged in as #{auth_hash.info.nickname}."
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end