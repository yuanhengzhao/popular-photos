class PhotosController < ApplicationController
	include ApplicationHelper
	include ::F00px::Request
  def popular
  	# initialize a F00px client to get 100 popular photos. 
  	@client = F00px::Client.new
  	response = @client.popular(rpp: 100, image_size: 3).body
  	# In this task, photos will be an array with photo hashes. Should create photo model for it in the future.
  	@photos = JSON.parse(response)['photos']
  end

  def likes
  	if user_logged_in?
	  	@id = params[:id]
	  	@likes = JSON.parse(@client.get("photos/#{@id}/votes").body)['total_items']
	  else
	  	redirect_to '/auth/500px'
	  end
  end
  # Send a 'like' to 500px.
  def like
    @id = params[:id]
    @client = F00px::Client.new
    @client.token = session[:oauth_token]
    @client.token_secret = session[:oauth_secret]
    if @client.post("photos/#{@id}/vote?vote=1").success?
      like = Like.find_or_create_by(user_id: session[:uid], photo_id: @id)
      like.save
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

  # 'Unlike' a photo - that is, remove a 'Like'.
  def unlike
    @id = params[:id]
    @client = F00px::Client.new
    @client.token = session[:oauth_token]
    @client.token_secret = session[:oauth_secret]
    if @client.delete("photos/#{@id}/vote?vote=0").success?
      Like.where(user_id: session[:uid], photo_id: @id).delete_all
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end
end
