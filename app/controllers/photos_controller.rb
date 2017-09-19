class PhotosController < ApplicationController
	include ApplicationHelper
  def popular
  	# initialize a F00px client to get 100 popular photos. 
  	client = f00_client()
  	response = client.popular(rpp: 100, image_size: 3).body
  	# In this task, photos will be an array with photo hashes. Should create photo model for it in the future.
  	@photos = JSON.parse(response)['photos']
    # returns all like records when user loged in.
    if user_logged_in?
      @likes = Like.user_likes(session[:uid])
    end
  end

  # Like function. Send the vote post request every time even though the image may unliked by this user.
  # Like/unlike status will be syncinzed to 500px server.
  def like
    @id = params[:id]
    client = f00_client()
    client.post("photos/#{@id}/vote?vote=1")
    like = Like.find_or_create_by(user_id: session[:uid], photo_id: id)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

  # Unlike function. Send the vote post request every time even though the image may unliked by this user.
  # Like/unlike status will be syncinzed to 500px server.
  def unlike
    id = params[:id]
    client = f00_client()
    client.delete("photos/#{@id}/vote?vote=0")
    Like.where(user_id: session[:uid], photo_id: id).delete_all
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end
end
