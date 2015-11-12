require 'spec_helper'

feature "hidden links project" do
	let(:user) {FactoryGirl.create(:user)}
	let(:admin) {FactoryGirl.create(:admin_user)}
	let!(:project) do
  		project = FactoryGirl.create(:project, name:"Pierde Muchos Fondos")
  		project.update(user: admin)
  		project
	end

	

	context "anonymous users" do
		scenario "cannot see the New Project Link" do
			visit projects_path
			assert_no_link_for "Nuevo Proyecto"
		end


		scenario "cannot see the Edit Post Link" do
			visit project_path(project)
			assert_no_link_for "Edit Project"
		end

		scenario "cannot see the Delete Post Link" do
			visit project_path(project)
			assert_no_link_for "Delete Project"
		end
		
	end

	context "regular users" do
		before { log_in!(user) }
		scenario "can see the New Project Link" do
			visit '/projects'
			assert_link_for "Nuevo Proyecto"
		end


		scenario "can see the Edit Post Link" do
			visit project_path(project)
			assert_link_for "Edit Project"
		end

		scenario "can see the Delete Post Link" do
			visit project_path(project)
			assert_link_for "Delete Project"
		end

	end

	context "admin users" do
		before { log_in_as!(admin) }
		scenario "can see the New Project Link" do
			visit projects_path
			assert_link_for "Nuevo Proyecto"
		end


		scenario "can see the Edit Post Link" do
			visit project_path(project)
			assert_link_for "Edit Project"
		end

		scenario "can see the Delete Post Link" do
			visit project_path(project)
			assert_link_for "Delete Project"
		end

		
	end


end