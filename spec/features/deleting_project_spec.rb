require 'spec_helper'

feature "Deleting Projects" do
	let!(:admin_user) {FactoryGirl.create(:admin_user)}
	let!(:project) do
  		project = FactoryGirl.create(:project, name: "Jorge")
  		project.update(user: admin_user)
  		project
	end
	
	before do
		log_in_as!(admin_user)
		visit projects_path

		click_link "Jorge"
		click_link "Delete Project"
	end
	scenario "Deleting a project" do
		
		

		expect(page).to have_content("El proyecto se ha eliminado.")

		visit projects_path

		expect(page).to have_no_content("Jorge")
	end
end