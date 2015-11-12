require 'spec_helper'

feature "Editing a project" do
	let!(:admin_user) {FactoryGirl.create(:admin_user)}
	let!(:project) do
  		project = FactoryGirl.create(:project, name:"Jorge")
  		project.update(user: admin_user)
  		project
	end

	before do
		log_in_as!(admin_user)
		
		visit projects_path

		click_link "Jorge"
		click_link "Edit Project"
	end
	scenario "Updating a project" do
		
		
		
		fill_in "Nombre", with: "hola@nuva.rocks"
		click_button "Update Project"

		expect(page).to have_content("El proyecto se ha modificado.")
	end

end