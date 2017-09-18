require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
	describe 'popular' do
		it "returns 200" do
        get 'popular'
        expect(response.status).to eq(200)
		end
	end
end
