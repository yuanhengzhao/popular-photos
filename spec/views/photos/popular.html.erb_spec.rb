require 'rails_helper'
require 'spec_helper'

RSpec.describe "photos/popular", type: :view do
  before(:each) do
  	client = F00px::Client.new
  	response = client.popular(rpp: 10, image_size: 3).body
  	photos = JSON.parse(response)['photos']
  	expect(photos.size).to eq(10)
  	assign(:photos, photos)
  end

  it "renders certain numbers of photos" do
  	render
  	assert_select "figure",  :count => 10
  	assert_select "img",  :count => 10
  	assert_select "figcaption", :count => 10
  end
end
