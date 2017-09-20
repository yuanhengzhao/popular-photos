require "rails_helper"

RSpec.describe PhotosController, :type => :routing do
	describe "routing" do
		it "routes to #popular" do
			expect(:get => "/photos/popular").to route_to("photos#popular")
		end
		it "routes to #root" do
			expect(:get => "/").to route_to("photos#popular")
		end

		it "routes to #like" do
			expect(:post => "photos/1/like").to route_to("photos#like", id: "1")
		end

		it "routes to #unlike" do
			expect(:delete => "photos/1/unlike").to route_to("photos#unlike", id: "1")
		end

		it "routes to omniauth callback" do
			expect(:get => '/auth/fiveHundredPx/callback').to route_to('sessions#create', provider: "fiveHundredPx")
		end

		it "routes to logout" do
			expect(:delete => 'logout').to route_to('sessions#destroy')
		end
	end
end

