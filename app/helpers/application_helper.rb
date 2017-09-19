module ApplicationHelper
	def user_logged_in?
    session.has_key? 'user'
  end
end
