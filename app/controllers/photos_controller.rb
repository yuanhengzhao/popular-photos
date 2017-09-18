class PhotosController < ApplicationController
  def popular
  	# initialize a F00px client to get 100 popular photos. 
  	@client = F00px::Client.new
  	response = @client.popular(rpp: 100, image_size: 3).body
  	# In this task, photos will be an array with photo hashes. Should create photo model for it in the future.
  	@photos = JSON.parse(response)['photos']
  end
end
