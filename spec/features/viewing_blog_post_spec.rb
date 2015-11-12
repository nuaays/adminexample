require 'spec_helper'

feature 'Viewing post' do
	
	before do
		user = FactoryGirl.create(:user)
		post = FactoryGirl.create(:post, name: "Pierde Fondos1")
		post.update(user: user)
		post.user = user
		post.save
		visit posts_path
	end	
	
	scenario "Listing all posts" do
		
		
		click_link "Pierde Fondos1"
		expect(page).to have_content("Pierde Fondos1")
	end

	
end