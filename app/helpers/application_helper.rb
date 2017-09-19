module ApplicationHelper
	def user_logged_in?
    session.has_key? 'user'
  end

  def f00_client
  	client = F00px::Client.new
  	if user_logged_in?
	  	client.token = session[:oauth_token]
	    client.token_secret = session[:oauth_secret]
	  end
    client
  end
end
