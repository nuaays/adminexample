require 'spec_helper'

feature 'Viewing project' do
	before do
		user = FactoryGirl.create(:user)
		project = FactoryGirl.create(:project, name: "Jorge")
		project.update(user: user)
		project.user = user
		project.save
		visit projects_path
	end	

	scenario "Listing all projects" do
		
		
		click_link "Jorge"
		expect(page).to have_content("Jorge")
	end

	
end