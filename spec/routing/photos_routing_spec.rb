require "rails_helper"

RSpec.describe PhotosController, :type => :routing do
	describe "routing" do
		it "routes to #popular" do
			expect(:get => "/photos/popular").to route_to("photos#popular")
		end
		it "routes to #root" do
			expect(:get =>"/").to route_to("photos#popular")
		end
	end
end

