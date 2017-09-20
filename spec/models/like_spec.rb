require 'rails_helper'

RSpec.describe Like, type: :model do
	describe "To initalize a like" do
		it "is invalid without user_id and photo_id" do
  		expect(FactoryGirl.build(:like)).not_to be_valid
		end

		it "is invalid without photo_id" do
			expect(FactoryGirl.build(:like, user_id: 1)).not_to be_valid
		end

		it "is invalid without user_id" do
			expect(FactoryGirl.build(:like, photo_id: 1)).not_to be_valid
		end

		it "is valid with both photo_id and user_id" do
			expect(FactoryGirl.build(:like, photo_id: 1, user_id: 1)).to be_valid
		end
	end

	describe "user_likes" do
		before do
			(1..3).each do |num|
				FactoryGirl.create(:like, user_id: 1, photo_id: num)
				FactoryGirl.create(:like, user_id: 2, photo_id: num)
			end
		end

		it "returns array with expected size and expected items." do
			expect(Like.user_likes(1)).to eq([1,2,3])
		end
	end
end
