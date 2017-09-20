require 'rails_helper'
require 'spec_helper'
require 'omniauth'
RSpec.describe PhotosController, type: :controller do
	
	describe 'popular' do
		it "returns 200" do
        get 'popular'
        expect(response.status).to eq(200)
		end
	end

	describe 'like' do
		subject { post 'like', params: { :id => '1' } }

	  before do
	    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:fiveHundredPx ]
	  end

		it "redirects to 500px auth page without loged in user." do
	  	expect(subject).to redirect_to("/auth/500px")
	  end

	  it "redirects to root with loged in user." do
			session[:user] = request.env['omniauth.auth']['info']['nickname']
	  	expect(subject).to redirect_to("/")
	  end
	end

	describe 'unlike' do
		subject { delete 'unlike', params: { :id => '1' } }
		
		before do
	    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:fiveHundredPx ]
	  end

		it "redirects to 500px auth page without loged in user." do
	  	expect(subject).to redirect_to("/auth/500px")
	  end

	  it "redirects to root with loged in user." do
			session[:user] = request.env['omniauth.auth']['info']['nickname']
	  	expect(subject).to redirect_to("/")
	  end
	end
end
