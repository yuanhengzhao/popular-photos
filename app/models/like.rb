class Like < ApplicationRecord
	# Get all photo_ids which are liked by a certain user.
	def self.user_likes(user_id)
		self.where(user_id: user_id).select("photo_id").map(&:photo_id)
	end
end
